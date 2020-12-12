# PRACTICE 5: CODE ANALYSIS OF K-MEANS METHOD

## Introduction

In this practice the code of the file "k_means_clustering.R" was run and some observations were made.

## Development

**1.** We determinate the current directory where we are working in R.  

```r
getwd()
```

![](https://github.com/sebastiansandovalcastro/DataMining/blob/images/unit3/practice5/image01.png)


**2.** We set the path where the K-Means file is located.

```r
setwd("C:/Users/Admin/Documents/9no Semestre/Git hub profe/DataMining/MachineLearning/K-Means")
```

**3.** We checked the path.

```r
getwd()
```

![](https://github.com/sebastiansandovalcastro/DataMining/blob/images/unit3/practice5/image02.png)


**4.** We import the dataset, only will take the Importamos el conjunto de datos, only the fourth and fifth columns.

```r
dataset = read.csv('Mall_Customers.csv')
dataset = dataset[4:5]
```

![](https://github.com/sebastiansandovalcastro/DataMining/blob/images/unit3/practice5/image03.png)


**5.** We generate a random number.

```r
set.seed(6)
```

**6.** We apply the Elbow method to find the optime number of clusters with the K-means function. 

A vector is created and vector and run a cycle for. 

In this cycle we assign titles to the axes of the graph.

```r
wcss = vector()
for (i in 1:10) wcss[i] = sum(kmeans(dataset, i)$withinss)
plot(1:10,
     wcss,
     type = 'b',
     main = paste('The Elbow Method'),
     xlab = 'Number of clusters',
     ylab = 'WCSS')
```

![](https://github.com/sebastiansandovalcastro/DataMining/blob/images/unit3/practice5/image04.png)     


**7.** We fit the dataset with K-Means. 

```r
set.seed(29)
kmeans = kmeans(x = dataset, centers = 5)
y_kmeans = kmeans$cluster
```

**8.** We create the graph to see the clusters. First we install the package _Cluster_ and run its library.

Finally we run the _clusplot_ function to graph.

```r
    install.packages('cluster')
    library(cluster)
    clusplot(dataset,
         y_kmeans,
         lines = 0,
         shade = TRUE,
         color = TRUE,
         labels = 2,
         plotchar = FALSE,
         span = TRUE,
         main = paste('Clusters of customers'),
         xlab = 'Annual Income',
         ylab = 'Spending Score')
```

![](https://github.com/sebastiansandovalcastro/DataMining/blob/images/unit3/practice5/image05.png)