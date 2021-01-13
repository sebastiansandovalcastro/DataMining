# PRACTICE 2 - MULTIPLE LINEAR REGRESSION

## Introduction
In this practice, we run the code in the _multiple_linear_regression.R_ file and we made a bunch of observations.

## Development

First we use _getwd()_ to see de current directory and we change the directory with _setwd()_ in order to be in the route were, the dataset file that we need, is. We check again the current directory in order to confirm the change.

```r
#Se utiliza para obtener el directorio actual.
getwd()

#Se utiliza para establecer un nuevo directorio.
setwd("C:/Users/Sebas/Desktop/PC/ESCUELA/9. NOVENO SEMESTRE/1. Minería de datos/MINERÍA DE DATOS (PROFESOR)/DataMining/MachineLearning/MultipleLinearRegression")

#Se utiliza para obtener el directorio actual (confirmación del cambio).
getwd()
```

![1.png](https://raw.github.com/sebastiansandovalcastro/DataMining/images/unit3/practice2/1.png)

We import the data in order to work with it. Then, we change the column values to numeric ID's. We print the dataset to see the imported data.

```r
#Importación de data set.
dataset <- read.csv('50_Startups.csv')

#Codificación de datos categóricos.
dataset$State = factor(dataset$State,
                       levels = c('New York', 'California', 'Florida'),
                       labels = c(1,2,3))

#Impresión de dataset.
dataset
```

![2.png](https://raw.github.com/sebastiansandovalcastro/DataMining/images/unit3/practice2/2.png)

Now, the catools library is used to split the dataset into two parts, being the
column profit where we will be based. The first part will be training_set and the
second the test_set, for this it is indicated that the ratio must be 0.8, which means
that this fraction will be taken.

```r
#Dividiendo el dataset en Training set y Test set.
library(caTools)
set.seed(123)
split <- sample.split(dataset$Profit, SplitRatio = 0.8)
training_set <- subset(dataset, split == TRUE)
test_set <- subset(dataset, split == FALSE)
```

![3.png](https://raw.github.com/sebastiansandovalcastro/DataMining/images/unit3/practice2/3.png)

We fit the multiple linear regression to training_set. 

```r
#Ajustando la regresión lineal múltiple al Training set.
#regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State)
regressor = lm(formula = Profit ~ .,
               data = training_set )
summary(regressor)
```

![4.png](https://raw.github.com/sebastiansandovalcastro/DataMining/images/unit3/practice2/4.png)

And we obtain the predictions using the training_set.

```r
#Predicción de resultados en Test set.
y_pred = predict(regressor, newdata = test_set)
y_pred
```

![5.png](https://raw.github.com/sebastiansandovalcastro/DataMining/images/unit3/practice2/5.png)

The model doesn't fit well, so we create another formula by two different ways.

The first one, we remove and check one by one. We check which fields have less weight and wich one can alter the result. We remove fields one by one.

```r
#Construyendo el modelo óptimo utilizando BackwardElimination.
regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State,
               data = dataset )
summary(regressor)

regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend,
               data = dataset )
summary(regressor)

regressor = lm(formula = Profit ~ R.D.Spend + Marketing.Spend,
               data = dataset )
summary(regressor)
```

![6.1.png](https://raw.github.com/sebastiansandovalcastro/DataMining/images/unit3/practice2/6.1.png)

![6.2.png](https://raw.github.com/sebastiansandovalcastro/DataMining/images/unit3/practice2/6.2.png)

![6.3.png](https://raw.github.com/sebastiansandovalcastro/DataMining/images/unit3/practice2/6.3.png)

And we obtain a better prediction from it.

```r
#Predicción.
y_pred = predict(regressor, newdata = test_set)
y_pred
```

![7.png](https://raw.github.com/sebastiansandovalcastro/DataMining/images/unit3/practice2/7.png)

Te second one, is creating a function called backwardElimination. This function works with two parameters: x and sl, where x is the length of the dataset (number of columns) and sl the minimum value.

The function is an automatization of the backward elimination did it before in order to obtain the best prediction at the end.

```r
#Función automática backwardElimination. 
backwardElimination <- function(x, sl) {
  numVars = length(x)
  for (i in c(1:numVars)){
    regressor = lm(formula = Profit ~ ., data = x)
    maxVar = max(coef(summary(regressor))[c(2:numVars), "Pr(>|t|)"])
    if (maxVar > sl){
      j = which(coef(summary(regressor))[c(2:numVars), "Pr(>|t|)"] == maxVar)
      x = x[, -j]
    }
    numVars = numVars - 1
  }
  return(summary(regressor))
}
```

![8.png](https://raw.github.com/sebastiansandovalcastro/DataMining/images/unit3/practice2/8.png)

Here, we just declare the SL variable with the a 0.05 value and then we use the function with the training set and the SL value as parameters.

```r
#Valor SL.
SL = 0.05

#dataset = dataset[, c(1,2,3,4,5)]
training_set
backwardElimination(training_set, SL)
```

![9.1.png](https://raw.github.com/sebastiansandovalcastro/DataMining/images/unit3/practice2/9.1.png)

![9.2.png](https://raw.github.com/sebastiansandovalcastro/DataMining/images/unit3/practice2/9.2.png)
