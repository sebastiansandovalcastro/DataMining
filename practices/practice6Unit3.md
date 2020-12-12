# PRACTICE 6: CODE ANALYSIS OF K-NN METHOD

## Introduction

In this practice the code of the file "knn.R" was run and some observations were made.

## Development

**1.** We determinate the current directory where we are working in R.  

```r
getwd()
```

![](https://github.com/sebastiansandovalcastro/DataMining/blob/images/unit3/practice6/practice6_01.png)


**2.** We set the path where the K-NN file is located.

```r
setwd("C:/Users/Admin/Documents/9no Semestre/Git hub profe/DataMining/MachineLearning/KNN")
```

**3.** We checked the path.

```r
getwd()
```

![](https://github.com/sebastiansandovalcastro/DataMining/blob/images/unit3/practice6/practice6_02.png)


**4.** We import the dataset, we'll take from the third to fifth column.

```r
dataset = read.csv('Social_Network_Ads.csv')
dataset = dataset[3:5]
```

![](https://github.com/sebastiansandovalcastro/DataMining/blob/images/unit3/practice6/practice6_03.png)



**5.** We use a factor to levels 0(no) and 1(yes) of the column _Purchased_ in the dataset.

```r
dataset$Purchased = factor(dataset$Purchased, levels = c(0, 1))
```

**6.** We split the dataset in _Training set_ and _Test set_.

We install the package _caTools_ to split and scale the data, we run its library. Also a ramdom number was created.

```r
install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.75)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)
```

**7.** We scale the two sets created to clean the data and obtain a better result when we apply the method.

```r
training_set[-3] = scale(training_set[-3])
test_set[-3] = scale(test_set[-3])
```

**8.** We fit the KNN classifier to the _Training set_ and the results of the _Test set_ are predicted. 

Previously we installed the class package and run your library.

```r
install.packages('class')
library(class)
y_pred = knn(train = training_set[, -3],
             test = test_set[, -3],
             cl = training_set[, 3],
             k = 5)
y_pred
```

![](https://github.com/sebastiansandovalcastro/DataMining/blob/images/unit3/practice6/practice6_04.png)


**9.** We create a Confusion Matrix. This is to check the effectiveness of the method.

```r
cm = table(test_set[, 3], y_pred)
cm
```

**10.** Finally we created a chart to visualize the results of _Training set_. First we run the _ElemStatLearn_ library that will allow us to obtain the graphic.

```r
library(ElemStatLearn)
set = training_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = knn(train = training_set[, -3],
             test = grid_set,
             cl = training_set[, 3],
             k = 5)
plot(set[, -3],
     main = 'K-NN Classifier (Training set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
```

![](https://github.com/sebastiansandovalcastro/DataMining/blob/images/unit3/practice6/practice6_05.png)


**11.** In the same way we create another graph to visualize the results of _Test set._

```r
library(ElemStatLearn)
set = test_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = knn(train = training_set[, -3],
             test = grid_set,
             cl = training_set[, 3],
             k = 5)
plot(set[, -3], main = 'K-NN Classifier (Test set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
```

![](https://github.com/sebastiansandovalcastro/DataMining/blob/images/unit3/practice6/practice6_06.png)