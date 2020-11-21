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