#Establecemos la ruta.
setwd("C:/Users/Sebas/Desktop/PC/ESCUELA/9. NOVENO SEMESTRE/1. Minería de datos/MINERÍA DE DATOS (PROFESOR)/DataMining/DataSets")

#Cargamos el archivo.
projectData <- read.csv('Project-Data.csv')

#Filtramos los géneros de películas necesarios.
projectDataGenre <- projectData[projectData$Genre %in% c("action", "adventure", "animation", "comedy", "drama"),]

#Filtramos los estudios de películas necesarios en base a los géneros necesarios.
projectDataGenreStudio <- projectDataGenre[projectDataGenre$Studio %in% c("Buena Vista Studios", "Fox", "Paramount Pictures", "Sony", "Universal", "WB"),]

#Utilizamos la librería ggplot2 para la graficación de datos.
library(ggplot2)

#Creamos inicialmente una gráfica que solo abarca los estudios necesarios, utilizando los ejes indicados.
#Añadimos la geometría jitter para visualizar los datos en forma de puntos y la geometría boxplot para representar cada género.
#En jitter, establecemos los tres tamaños de la columna "Budget...mill" para el tamaño de los puntos, divididos por estudio.
#En boxplot, establecemos la transparencia a 0.8 en alpha y nos deshacemos de los puntos negros sobrantes en las orillas.
#Agregamos los títulos correspondientes en la gráfica y a los ejes.
