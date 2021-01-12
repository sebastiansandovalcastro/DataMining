# EVALUATION UNIT 4

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


**EVALUATION UNIT 4**


**STUDENT**

MARTINEZ FLORES PAMELA STEPHANY	16212034

SANDOVAL CASTRO SEBASTIÁN	16212076


Tijuana, Baja California, december 18, 2020.

</div>

## INSTRUCTIONS

- _Implement the K-Means grouping model with the Iris.csv data set, using the kmeans () method in R._

- _Once the clustering model is obtained, do a visualization analysis of the corresponding data._

- _At the end of the development, explain in detail how the K-Means grouping model was consistent and what the observations were in the data visualization analysis._

## DEVELOPMENT

First, we start calling the necessary libraries.

```r
#Librerías necesarias.
library(cluster)
```

We set the correct route in order to call the iris.csv data in a simple way in the next step.

```r
#Ruta.
setwd("C:/Users/Sebas/Desktop")
```

Then, we proceed to import the iris.csv file into the irisdf data frame, and select only the first four needed columns.

```r
#Importación de datos iris.csv.
irisdf = read.csv("iris.csv")
irisdf = irisdf[1:4]
```

Here, we use the elbow method in order to obtain a graph that we can see and decide how many clusters we need. In this case, the elbow is right above the number 3, so we decide to use that number of clusters.

```r
#Uso el método del codo para encontrar el número de clústers óptimo.
set.seed(6)
wcss = vector()
for (i in 1:10) wcss[i] = sum(kmeans(irisdf, i)$withinss)
plot(1:10,
     wcss,
     type = 'b',
     main = 'The Elbow Method',
     xlab = 'Number of clusters',
     ylab = 'WCSS')
```

We finally fit the K-MEANS model into the dataset irisdf, where we stablish the 3 clusters for the groups.

```r
#Ajustando el modelo de agrupación K-MEANS al dataset irisdf.
set.seed(29)
kmeans = kmeans(x = irisdf, centers = 3)
y_kmeans = kmeans$cluster
```

And then, we just visualize the plotted K-MEANS model, where the features Lenght and Width are the axes values (x and y respectively).

```r
#Visualización de clústers.
clusplot(irisdf,
         y_kmeans,
         lines = 0,
         shade = TRUE,
         color = TRUE,
         labels = 2,
         plotchar = FALSE,
         span = TRUE,
         main = 'Clusters of iris.csv',
         xlab = 'Length',
         ylab = 'Width')
```

## FULL CODE

```r
#Librerías necesarias.
library(cluster)

#Ruta.
setwd("C:/Users/Sebas/Desktop")

#Importación de datos iris.csv.
irisdf = read.csv("iris.csv")
irisdf = irisdf[1:4]

#Uso el método del codo para encontrar el número de clústers óptimo.
set.seed(6)
wcss = vector()
for (i in 1:10) wcss[i] = sum(kmeans(irisdf, i)$withinss)
plot(1:10,
     wcss,
     type = 'b',
     main = 'The Elbow Method',
     xlab = 'Number of clusters',
     ylab = 'WCSS')

#Ajustando el modelo de agrupación K-MEANS al dataset irisdf.
set.seed(29)
kmeans = kmeans(x = irisdf, centers = 3)
y_kmeans = kmeans$cluster

#Visualización de clústers.
clusplot(irisdf,
         y_kmeans,
         lines = 0,
         shade = TRUE,
         color = TRUE,
         labels = 2,
         plotchar = FALSE,
         span = TRUE,
         main = 'Clusters of iris.csv',
         xlab = 'Length',
         ylab = 'Width')
```

See the [full code](https://raw.github.com/sebastiansandovalcastro/DataMining/unit4/evaluation/evaluationUnit4.R) here.

## RESULTS

The objective of K-MEANS is simple: group similar data points together and discover underlying patterns. To achieve this objective, K-means looks for a fixed number (k) of clusters in a dataset, where a cluster refers to a collection of data points aggregated together because of certain similarities.

The k number refers to the number of centroids that is needed in the dataset. A centroid is the imaginary or real location representing the center of the cluster.

The K-MEANS algorithm identifies k number of centroids, and then allocates every data point to the nearest cluster, while keeping the centroids as small as possible.

As we can see, we decided the k number using the elbow method, where we choose the value just where the change inclination in the graph occurs, in this case, the number 3.

`Elbow Method.`

![1.png](https://raw.github.com/sebastiansandovalcastro/DataMining/images/unit4/evaluation/1.png)

Using that number of clusters, we can see that the data is clasified in three parts.

The first group are the dots where the length is between -0.5 and 1.6 (approximately) and the width is between -3 and 1 (approx. too).

The second group are the dots where the length and the width are superior compared to the first group.

The third and final group are the dots where the length is lower compared with the other two groups, but the width changes a lot.

`Clusters.`

![2.png](https://raw.github.com/sebastiansandovalcastro/DataMining/images/unit4/evaluation/2.png)