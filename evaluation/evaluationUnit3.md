# EVALUATION UNIT 3

<div align="center">

**TECNOLÓGICO NACIONAL DE MÉXIO**

INSTITUTO TECNOLÓGICO DE TIJUANA

SUBDIRECCIÓN ACADÉMICA
 
DEPARTAMENTO DE SISTEMAS Y COMPUTACIÓN
 
SEMESTRE SEPTIEMBRE 2020 – ENERO 2021

INGENIERÍA EN SISTEMAS COMPUTACIONALES

 
 [![](https://upload.wikimedia.org/wikipedia/commons/2/2e/ITT.jpg)](https://upload.wikimedia.org/wikipedia/commons/2/2e/ITT.jpg)

**MASTER**

JOSÉ CHRISTIAN ROMERO HERNÁNDEZ

**CLASS**

DATA MINING
BDD-1703 SC9A, L - V 17:00 - 18:00 (91L4/Q102)


**EVALUATION UNIT 3**


**STUDENT**

MARTINEZ FLORES PAMELA STEPHANY	16212034

SANDOVAL CASTRO SEBASTIÁN	16212076


Tijuana, Baja California, december 14, 2020.

</div>

## INSTRUCTIONS

- _Implement the Naive Bayes classification model with the dataset Social_Network_Ads.csv and use the e1071 library with the naiveBayes() function._

- _Once the classifier is obtained, do the data visualization analysis._

- _At the end of the development, explain in detail the model of Naive Bayes classification and the detailed explanation of the data visualization._

## DEVELOPMENT

First we call the necessary libraries for the development of the code. In this case, we need to make use of the libraries: e1071 (for the naiveBayes() function), caTools (for the split and scale of the data) and ElemStatLearn (for the results visualization).

```r
#Librerías a utilizar.
library(e1071)
library(caTools)
library(ElemStatLearn)
```

We proceed to read the csv file with the full data. We call the _Social_Network_Ads.csv_ file in order to work with it. Once we read it and save it in a dataset, we select just the columns that we need to work, so we drop the first and second column, picking just the colmuns 3 to 5. In this case, we are gonna work with the columns _Age_, _EstimatedSalary_ and _Purchased_.

```r
#Lectura del csv.
dataset <- read.csv("C:/Users/Sebas/Desktop/Social_Network_Ads.csv")
dataset = dataset[3:5]
```

Now, we use the function factor in the column _Purchased_ from the dataset created before. We establish the levels as the values of that column: 0 and 1. This values are going to be the _No_ and the _Yes_ values for the Naive Bayes algorithm as response to the categories that we are using. The goal here is determinate if somebody, according to the _Age_ and the _EstimatedSalary_, is going to purchase X particular thing.

```r
#Uso de factor para niveles 0 (no) y 1 (si) de la columna Purchased en el dataset.
dataset$Purchased = factor(dataset$Purchased, levels = c(0, 1))
```

Once we already have the levels, we set a random seed for the split in two sets: the _training_set_ and the _test_set_.

We assign a 0.75 value to the SplitRatio and this amount of data will be dedicated for train the algorithm, so we save that split in _training_set_.

The rest subset will be for test the algorithm, so we save that split in _test_set_.

```r
#Establecimiento de semilla y preparación de training_set y test_set.
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.75)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)
```

We scale the two created sets in order to clean the data and obtain a good result when we'll use the algorithm.

```r
#Escalamiento para normalización y limpieza de datos.
training_set[-3] = scale(training_set[-3])
test_set[-3] = scale(test_set[-3])
```

We can fit already the Naive Bayes algorithm to the training set.

```r
#Ajustando Naive Bayes a training_set.
classifier = naiveBayes(formula = Purchased ~ .,
                 data = training_set,
                 type = 'C-classification',
                 kernel = 'linear')
```

We make the predictions for the _test_set_ results.

```r
#Prediciendo los resultados para test_set.
y_pred = predict(classifier, newdata = test_set[-3])
y_pred
```

And we create the confusion matrix.

```r
#Matriz de confusión.
cm = table(test_set[, 3], y_pred)
cm
```

Finally, we visualize the _training_set_ and the _test_set_ results, and we can proceed to analyze the information.

```r
#Visualización de resultados de training_set.
set = training_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = predict(classifier, newdata = grid_set)
plot(set[, -3],
     main = 'SVM (Training set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
```

```r
#Visualización de resultados de test_Set.
set = test_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = predict(classifier, newdata = grid_set)
plot(set[, -3], main = 'SVM (Test set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
```

## FULL CODE

```r
#Librerías a utilizar.
library(e1071)
library(caTools)
library(ElemStatLearn)

#Lectura del csv.
dataset <- read.csv("C:/Users/Sebas/Desktop/Social_Network_Ads.csv")
dataset = dataset[3:5]

#Uso de factor para niveles 0 (no) y 1 (si) de la columna Purchased en el dataset.
dataset$Purchased = factor(dataset$Purchased, levels = c(0, 1))

#Establecimiento de semilla y preparación de training_set y test_set.
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.75)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

#Escalamiento para normalización y limpieza de datos.
training_set[-3] = scale(training_set[-3])
test_set[-3] = scale(test_set[-3])

#Ajustando Naive Bayes a training_set.
classifier = naiveBayes(formula = Purchased ~ .,
                 data = training_set,
                 type = 'C-classification',
                 kernel = 'linear')

#Prediciendo los resultados para test_set.
y_pred = predict(classifier, newdata = test_set[-3])
y_pred

#Matriz de confusión.
cm = table(test_set[, 3], y_pred)
cm

#Visualización de resultados de training_set.
set = training_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = predict(classifier, newdata = grid_set)
plot(set[, -3],
     main = 'SVM (Training set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))

#Visualización de resultados de test_Set.
set = test_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = predict(classifier, newdata = grid_set)
plot(set[, -3], main = 'SVM (Test set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
```

See the [full code](https://raw.github.com/sebastiansandovalcastro/DataMining/unit3/evaluation/evaluationUnit3.R) here.

## RESULTS

Naive Bayes is a classifier algorithm that assumes that the presence of a particular feature in a class is unrelated to the presence of any other feature. It works with classes or categories in order to determinate, as a conclution, if some event will happen or not.

We can observe and understand more with the obtained results:

In the training set results we can see that the majority of dots are in the red area. We can deduce that the young people and the young adults have a low salary, or just a little bit above the average, so this group of people can't purchase the X thing.

The people that can purchase the X thing are the older people (with good salary in the majority of cases).

`Training set results.`

![training_set.png](https://raw.github.com/sebastiansandovalcastro/DataMining/images/unit3/evaluation/training_set.png)

For the test set results we can observe a less bunch of dots compared to the previous graph, but the same conclusion.

As younger the people are, less these people can purchase the X especific thing. Also, they seem to have a low salary compared to the people who can purchase the X thing (in the majority of the cases).

`Test set results.`

![test_set.png](https://raw.github.com/sebastiansandovalcastro/DataMining/images/unit3/evaluation/test_set.png)