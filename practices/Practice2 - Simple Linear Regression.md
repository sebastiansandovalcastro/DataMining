# PRACTICE 2 - SIMPLE LINEAR REGRESSION

## Introduction
In this practice, we run the code in the _simpleLinearRegression.R_ file and we made a bunch of observations.

## Development

First we use _getwd()_ to see de current directory.

	#Se utiliza para obtener el directorio actual.
	getwd()

![1.png](https://raw.github.com/sebastiansandovalcastro/DataMining/images/unit2/practice2/1.png)

We change the directory with _setwd()_ in order to be in the route were, the dataset file that we need, is.

	#Se utiliza para establecer un nuevo directorio.
	setwd("C:/Users/Sebas/Desktop/PC/ESCUELA/9. NOVENO SEMESTRE/1. Minería de datos/MINERÍA DE DATOS (PROFESOR)/DataMining/MachineLearning/SimpleLinearRegression")

![2.png](https://raw.github.com/sebastiansandovalcastro/DataMining/images/unit2/practice2/2.png)

We check again the current directory in order to confirm the change.

	#Se utiliza para obtener el directorio actual (confirmación del cambio).
	getwd()

![3.png](https://raw.github.com/sebastiansandovalcastro/DataMining/images/unit2/practice2/3.png)

Finally, we import the _Salary_Data.csv_ file with the _read.csv()_ function, and we save it in the dataset titled "_dataset_".

	#Importación de dataset Salary_Data.csv en variable "dataset".
	dataset <- read.csv('Salary_Data.csv')

![4.png](https://raw.github.com/sebastiansandovalcastro/DataMining/images/unit2/practice2/4.png)

We use the library _caTools_ to split the dataset "_dataset_" in two by the column "_Salary_". We named the first split as "_training_set_" with all the TRUE values, and we named the second split as "_test_set_" with all the FALSE values.

	#Se divide a "dataset" en "training_set" (split = TRUE) y "test_set" (split = FALSE), utilizando la librería "caTools" para hacer el split.
	library(caTools)
	set.seed(123)
	split <- sample.split(dataset$Salary, SplitRatio = 2/3)
	training_set <- subset(dataset, split == TRUE)
	test_set <- subset(dataset, split == FALSE)

![5.png](https://raw.github.com/sebastiansandovalcastro/DataMining/images/unit2/practice2/5.png)