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
projectDataGraph <- ggplot(data = projectDataGenreStudio, aes(x = Genre, y = Gross...US)) + 
  geom_jitter(aes(size = Budget...mill., colour = Studio)) + 
  geom_boxplot(alpha = 0.8, outlier.colour = NA) + 
  ggtitle("Domestic Gross % by Genre") +
  xlab("Genre") + 
  ylab("Gross % US")
projectDataGraph

#Agregamos los títulos correspondientes en los divisores.
projectDataGraph$labels$size <- "Budget $M"
projectDataGraph$labels$colour <- "Studio"
projectDataGraph

#Utilizamos la librería extrafont para el uso de fuentes.
library(extrafont)

#Importamos las fuentes que tenemos en el equipo (5 min de carga).
font_import()

#Cargamos las fuentes del equipo.
loadfonts(device = "win")

#Se adapta la gráfica al tema de ejemplo.
#Se le da una fuente "Comic Sans MS".
#Se le da al título del gráfico un tamaño de 20 y se ajusta al centro.
#A los títulos de los ejes se les asigna un color morado, con letra tamaño 18.
#A los elementos del eje x se les asigna una letra tamaño 12.
#A los elementos del eje y se les asigna una letra tamaño 08.
projectDataGraph <- projectDataGraph + 
  theme(
    text = element_text(family = "Comic Sans MS"),
    plot.title   = element_text(size = 20, hjust = 0.5),
    axis.title.x = element_text(color = "purple", size = 18),
    axis.title.y = element_text(color = "purple", size = 18),
    axis.text.x  = element_text(size = 12),
    axis.text.y  = element_text(size = 08)
    )
projectDataGraph