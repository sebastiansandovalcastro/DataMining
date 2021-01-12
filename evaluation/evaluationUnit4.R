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