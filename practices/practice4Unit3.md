# PRACTICE 4 - DECISION TREE CLASSIFICATION

## Introduction
In this practice, we run the code in the _decision_tree_classification.R_ file and we made a bunch of observations.

## Development

First we use _getwd()_ to see de current directory and we change the directory with _setwd()_ in order to be in the route were, the dataset file that we need, is. We check again the current directory in order to confirm the change.

```r
#Se utiliza para obtener el directorio actual.
getwd()

#Se utiliza para establecer un nuevo directorio.
setwd("C:/Users/Sebas/Desktop/PC/ESCUELA/9. NOVENO SEMESTRE/1. Minería de datos/MINERÍA DE DATOS (PROFESOR)/DataMining/MachineLearning/DesicionThree")

#Se utiliza para obtener el directorio actual (confirmación del cambio).
getwd()
```

![1.png](https://raw.github.com/sebastiansandovalcastro/DataMining/images/unit3/practice4/1.png)

We import the data in order to work with it. Then, we select just the columns that we need.

```r
#Importación de dataset y selección de columnas necesarias.
dataset = read.csv('Social_Network_Ads.csv')
dataset = dataset[3:5]
```

![2.png](https://raw.github.com/sebastiansandovalcastro/DataMining/images/unit3/practice4/2.png)

We use factor to stablish the levels 0 and 1 of the column Purchased in the dataset.

```r
#Uso de factor para niveles 0 (no) y 1 (si) de la columna Purchased en el dataset.
dataset$Purchased = factor(dataset$Purchased, levels = c(0, 1))
```

![3.png](https://raw.github.com/sebastiansandovalcastro/DataMining/images/unit3/practice4/3.png)

Now, the catools library is used to split the dataset into two parts, being the
column Purchased where we will be based. The first part will be training_set and the
second the test_set, for this it is indicated that the ratio must be 0.75, which means
that this fraction will be taken.

```r
#División de dataset en training_set y test_set.
library(caTools)
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.75)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)
```

![4.png](https://raw.github.com/sebastiansandovalcastro/DataMining/images/unit3/practice4/4.png)

We scale the training_set and the test_set.

```r
#Escalamiento de valores en training_set y test_Set.
training_set[-3] = scale(training_set[-3])
test_set[-3] = scale(test_set[-3])
```

![5.png](https://raw.github.com/sebastiansandovalcastro/DataMining/images/unit3/practice4/5.png)

We fit the decision tree to the training_set.

```r
#Ajuste de árbol de decisión a training_set.
library(rpart)
classifier = rpart(formula = Purchased ~ .,
                   data = training_set)
```

![6.png](https://raw.github.com/sebastiansandovalcastro/DataMining/images/unit3/practice4/6.png)

And then we make the predictions.

```r
#Predicción de resultados en test_set.
y_pred = predict(classifier, newdata = test_set[-3], type = 'class')
y_pred
```

![7.png](https://raw.github.com/sebastiansandovalcastro/DataMining/images/unit3/practice4/7.png)

We create the confusion matrix.

```r
#Matriz de confusión.
cm = table(test_set[, 3], y_pred)
cm
```

![8.png](https://raw.github.com/sebastiansandovalcastro/DataMining/images/unit3/practice4/8.png)

We visualize the training_set results.

```r
#Visualización de resultados en training_set.
library(ElemStatLearn)
set = training_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = predict(classifier, newdata = grid_set, type = 'class')
plot(set[, -3],
     main = 'Decision Tree Classification (Training set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
```

![9.1.png](https://raw.github.com/sebastiansandovalcastro/DataMining/images/unit3/practice4/9.1.png)

We visualize the test_set results.

```r
#Visualización de resultados en test_set.
library(ElemStatLearn)
set = test_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = predict(classifier, newdata = grid_set, type = 'class')
plot(set[, -3], main = 'Decision Tree Classification (Test set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
```

![9.2.png](https://raw.github.com/sebastiansandovalcastro/DataMining/images/unit3/practice4/9.2.png)

And we visualize the tree at the end.

```r
#Graficación del árbol.
plot(classifier)
text(classifier, cex=0.6)
```

![9.3.png](https://raw.github.com/sebastiansandovalcastro/DataMining/images/unit3/practice4/9.3.png)