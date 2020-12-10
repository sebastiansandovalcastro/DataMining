# PRACTICE 3 - LOGISTIC REGRESSION

## Introduction
In this practice, we run the code in the _logisticRegression.R_ file and we made a bunch of observations.

## Development

First we use _getwd()_ to see de current directory and we change the directory with _setwd()_ in order to be in the route were, the dataset file that we need, is. We check again the current directory in order to confirm the change.

```r
#Se utiliza para obtener el directorio actual.
getwd()

#Se utiliza para establecer un nuevo directorio.
setwd("C:/Users/Sebas/Desktop/PC/ESCUELA/9. NOVENO SEMESTRE/1. Minería de datos/MINERÍA DE DATOS (PROFESOR)/DataMining/MachineLearning/LogisticRegression")

#Se utiliza para obtener el directorio actual (confirmación del cambio).
getwd()
```

![1.png](https://raw.github.com/sebastiansandovalcastro/DataMining/images/unit3/practice3/1.png)

We import the data in order to work with it. Then, we select just the columns that we need.

```r
#Importación de dataset y selección de columnas necesarias.
dataset <- read.csv('Social_Network_Ads.csv')
dataset <- dataset[, 3:5]
```

![2.png](https://raw.github.com/sebastiansandovalcastro/DataMining/images/unit3/practice3/2.png)

Now, the catools library is used to split the dataset into two parts, being the
column Purchased where we will be based. The first part will be training_set and the
second the test_set, for this it is indicated that the ratio must be 0.75, which means
that this fraction will be taken.

```r
#División de dataset en training_set y test_set.
library(caTools)
set.seed(123)
split <- sample.split(dataset$Purchased, SplitRatio = 0.75)
training_set <- subset(dataset, split == TRUE)
test_set <- subset(dataset, split == FALSE)
```

![3.png](https://raw.github.com/sebastiansandovalcastro/DataMining/images/unit3/practice3/3.png)

We scale the training_set and the test_set.

```r
#Escalamiento de valores en training_set y test_Set.
training_set[, 1:2] <- scale(training_set[, 1:2])
test_set[, 1:2] <- scale(test_set[, 1:2])
```

![4.png](https://raw.github.com/sebastiansandovalcastro/DataMining/images/unit3/practice3/4.png)

We fit the logistic regression to the training_set.

```r
#Ajuste de regresión logística a training_set.
classifier = glm(formula = Purchased ~ .,
                 family = binomial,
                 data = training_set)
```

![5.png](https://raw.github.com/sebastiansandovalcastro/DataMining/images/unit3/practice3/5.png)

And then we make the predictions.

```r
#Predicción de resultados en test_set.
prob_pred = predict(classifier, type = 'response', newdata = test_set[-3])
prob_pred
y_pred = ifelse(prob_pred > 0.5, 1, 0)
y_pred
```

![6.1.png](https://raw.github.com/sebastiansandovalcastro/DataMining/images/unit3/practice3/6.1.png)

![6.2.png](https://raw.github.com/sebastiansandovalcastro/DataMining/images/unit3/practice3/6.2.png)

We create the confusion matrix.

```r
#Matriz de confusión.
cm = table(test_set[, 3], y_pred)
cm
```

![7.png](https://raw.github.com/sebastiansandovalcastro/DataMining/images/unit3/practice3/7.png)

We plot the training_set and the test_set by each value.

```r
#Graficación de training_set y test_set.
library(ggplot2)
ggplot(training_set, aes(x=EstimatedSalary, y=Purchased)) + geom_point() + 
  stat_smooth(method="glm", method.args=list(family="binomial"), se=FALSE)
```

![8.1.png](https://raw.github.com/sebastiansandovalcastro/DataMining/images/unit3/practice3/8.1.png)

```r
ggplot(training_set, aes(x=Age, y=Purchased)) + geom_point() + 
  stat_smooth(method="glm", method.args=list(family="binomial"), se=FALSE)
```

![8.2.png](https://raw.github.com/sebastiansandovalcastro/DataMining/images/unit3/practice3/8.2.png)

```r
ggplot(test_set, aes(x=EstimatedSalary, y=Purchased)) + geom_point() + 
  stat_smooth(method="glm", method.args=list(family="binomial"), se=FALSE)
```

![8.3.png](https://raw.github.com/sebastiansandovalcastro/DataMining/images/unit3/practice3/8.3.png)

```r
ggplot(test_set, aes(x=Age, y=Purchased)) + geom_point() + 
  stat_smooth(method="glm", method.args=list(family="binomial"), se=FALSE)
```

![8.4.png](https://raw.github.com/sebastiansandovalcastro/DataMining/images/unit3/practice3/8.4.png)

We visualize the training_set results.

```r
#Visualización de resultados en training_set.
library(ElemStatLearn)
set = training_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
prob_set = predict(classifier, type = 'response', newdata = grid_set)
y_grid = ifelse(prob_set > 0.5, 1, 0)
plot(set[, -3],
     main = 'Logistic Regression (Training set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
```

![9.1.png](https://raw.github.com/sebastiansandovalcastro/DataMining/images/unit3/practice3/9.1.png)

And we visualize the test_set results.

```r
#Visualización de resultados en test_set.
library(ElemStatLearn)
set = test_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
prob_set = predict(classifier, type = 'response', newdata = grid_set)
y_grid = ifelse(prob_set > 0.5, 1, 0)
plot(set[, -3],
     main = 'Logistic Regression (Test set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
```

![9.2.png](https://raw.github.com/sebastiansandovalcastro/DataMining/images/unit3/practice3/9.2.png)
