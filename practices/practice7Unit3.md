# PRACTICE 7: CODE ANALYSIS OF RANDOM FOREST METHOD

## Introduction

In this practice the code of the file "random_forest_classification.R" was run and some observations were made.

## Development

**1.** We determinate the current directory where we are working in R.  

```r
getwd()
```

![](https://github.com/sebastiansandovalcastro/DataMining/blob/images/unit3/practice7/practice7_01.png)


**2.** We set the path where the Random Forest file is located.

```r
setwd("C:/Users/Admin/Documents/9no Semestre/Git hub profe/DataMining/MachineLearning/RandomForest")
```

**3.** We checked the path.

```r
getwd()
```

![](https://github.com/sebastiansandovalcastro/DataMining/blob/images/unit3/practice7/practice7_02.png)


**4.** We import the dataset, we'll take from the third to fifth column.

```r
dataset = read.csv('Social_Network_Ads.csv')
dataset = dataset[3:5]
```

![](https://github.com/sebastiansandovalcastro/DataMining/blob/images/unit3/practice7/practice7_03.png)



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

**8.** We fit the classifier of Random Forest to the _Training set_.

We install the package of _RandomForest_ and run.

```r
install.packages('randomForest')
library(randomForest)
set.seed(123)
classifier = randomForest(x = training_set[-3],
                          y = training_set$Purchased,
                          ntree =10)
```                          

**9.** We predict the Test set results.

```r
y_pred = predict(classifier, newdata = test_set[-3])
y_pred
```

![](https://github.com/sebastiansandovalcastro/DataMining/blob/images/unit3/practice7/practice7_04.png)

**10.** We create a Confusion Matrix. This is to check the effectiveness of the method.

```r
cm = table(test_set[, 3], y_pred)
cm
```

![](https://github.com/sebastiansandovalcastro/DataMining/blob/images/unit3/practice7/practice7_05.png)



**11.** Finally we created a chart to visualize the results of _Training set_. First we run the _ElemStatLearn_ library that will allow us to obtain the graphic.

```r
library(ElemStatLearn)
set = training_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = predict(classifier, grid_set)
plot(set[, -3],
     main = 'Random Forest Classification (Training set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
```

![](https://github.com/sebastiansandovalcastro/DataMining/blob/images/unit3/practice7/practice7_06.png)



**12.** In the same way we create another graph to visualize the results of _Test set._

```r
library(ElemStatLearn)
set = test_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = predict(classifier, grid_set)
plot(set[, -3], main = 'Random Forest Classification (Test set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
```

![](https://github.com/sebastiansandovalcastro/DataMining/blob/images/unit3/practice7/practice7_07.png)



**13.** Choosing the number of trees

```r
plot(classifier)
```

![](https://github.com/sebastiansandovalcastro/DataMining/blob/images/unit3/practice7/practice7_08.png)