# EVALUATION UNIT 2

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


**EVALUATION UNIT 2**


**STUDENT**

MARTINEZ FLORES PAMELA STEPHANY	16212034

SANDOVAL CASTRO SEBASTIÁN	16212076


Tijuana, Baja California, november 20, 2020.

</div>

## INSTRUCTIONS

_Develop the next problem with R and RStudio for knowledge extraction
that the problem requires._

- The directors of the movie review website are very happy with your previous delivery and now they have a new request for you.
- The previous consultant had created a chart for them which is illustrated in the following image:

![graficoInicial.png](https://raw.github.com/sebastiansandovalcastro/DataMining/images/unit2/evaluation/graficoInicial.png)

- However, they lost the R code used to create the graph and it cannot be recovered.
- Your task is make the code that will recreate the same graph, making it look like as close as possible to the original.

## DEVELOPMENT

### PREPARING THE WORKSTATION

We prepared the workstation with _setwd()_, where we indicated the route were the Project-Data.csv file was.

	#Establecemos la ruta.
	setwd("C:/Users/Sebas/Desktop/PC/ESCUELA/9. NOVENO SEMESTRE/1. Minería de datos/MINERÍA DE DATOS (PROFESOR)/DataMining/DataSets")

Then, we just read the csv file with _read.csv()_ function and save the result in _projectData_.

	#Cargamos el archivo.
	projectData <- read.csv('Project-Data.csv')

### FILTERING THE DATA

As we know by the previous [graph](https://raw.github.com/sebastiansandovalcastro/DataMining/images/unit2/evaluation/graficoInicial.png), not every genre and studio is used, so we decided to use only the needed information.

We started filtering the main data in _projectData_, using only the genres _action_, _adventure_, _animation_, _comedy_ and _drama_. We saved the result information as _projectDataGenre_.

	#Filtramos los géneros de películas necesarios.
	projectDataGenre <- projectData[projectData$Genre %in% c("action", "adventure", "animation", "comedy", "drama"),]

Once we had the data with only the five genres that we needed, we started another data set were we was using not just the five genres, but the six movie studio too. Here we used only the studios _Buena Vista Studios_, _Fox_, _Paramount Pictures_, _Sony_, _Universal_ and _WB_. We saved the result information as _projectDataGenreStudio_ and this data set became the main data set for the rest of the document.

	#Filtramos los estudios de películas necesarios en base a los géneros necesarios.
	projectDataGenreStudio <- projectDataGenre[projectDataGenre$Studio %in% c("Buena Vista Studios", "Fox", "Paramount Pictures", "Sony", "Universal", "WB"),]

### PLOTTING THE DATA

Before we started to plotting the data, we imported the _ggplot2_ library.

	#Utilizamos la librería ggplot2 para la graficación de datos.
	library(ggplot2)

We started with the creation of a graph using the _ggplot()_ function, where the main data was _projectDataGenreStudio_ and the axes were _Genre_ in _x_ and _Gross...US_ in_y_.

Then, we used the _geom_jitter()_ function to plot the data in a dot shape, were we used the _Budget...mill_ values for the sizes of the dots and the _Studio_ values for the colour.

We used the _geom_boxplot()_ to make the box shaped data, with a 0.8 transparency in _alpha = 0.8_ and removing the garbage dots with _outlier.colour = NA_.

We gave the title _Domestic Gross % by Genre_ to the graph with _ggtitle()_ function, and we used _xlab()_ and _ylab()_ function to rename the axes _x_ and _y_ as _Genre_ and _Gross % US_ respectively.

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

![grafico1.png](https://raw.github.com/sebastiansandovalcastro/DataMining/images/unit2/evaluation/grafico1.png)

We used the next code to rename the labels of the size and the colour as _Budget $M_ and _Studio_ respectively.

	#Agregamos los títulos correspondientes en los divisores.
	projectDataGraph$labels$size <- "Budget $M"
	projectDataGraph$labels$colour <- "Studio"
	projectDataGraph

![grafico2.png](https://raw.github.com/sebastiansandovalcastro/DataMining/images/unit2/evaluation/grafico2.png)

First of all, we imported the _extrafont_ library in order to use the necesarry fonts in the final plotting.

	#Utilizamos la librería extrafont para el uso de fuentes.
	library(extrafont)

We used the _font_import()_ function to import all the fonts in the machine. This process was slow, around five minutes.

	#Importamos las fuentes que tenemos en el equipo (5 min de carga).
	font_import()

Once we imported all the fonts in the PC, we load the fonts with _loadfonts()_ function. In this case, using _"win"_ to indicate that the current PC at the moment was a Windows device.

	#Cargamos las fuentes del equipo.
	loadfonts(device = "win")

Finally we adapt the graph to the given example, using "Comic Sans MS" as the dominant font of the graph.

The title size of the plot was 20, and centered with _hjust_ on a 0.5 value.

We gave to the axes titles the purple colour just like the example, and sized the titles to 18.

The elements on the _x_ axe were sized on 12 and the elements on the _y_ axe were sized on 08.

We plotted the final graph at the end.

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

## RESULT

We obtained the next graphs as final result:

![graficoFinal.png](https://raw.github.com/sebastiansandovalcastro/DataMining/images/unit2/evaluation/graficoFinal.png)