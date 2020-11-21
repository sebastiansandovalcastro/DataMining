# PRACTICE 2 - SIMPLE LINEAR REGRESSION

## Introduction
In this practice, we run the code in the _simpleLinearRegression.R_ file and we made a bunch of observations.

## Development

First we use _getwd()_ to see de current directory.

	#Se utiliza para obtener el directorio actual.
	getwd()

![1.png](https://raw.github.com/sebastiansandovalcastro/DataMining/images/unit3/practice1/1.png)

We change the directory with _setwd()_ in order to be in the route were, the dataset file that we need, is.

	#Se utiliza para establecer un nuevo directorio.
	setwd("C:/Users/Sebas/Desktop/PC/ESCUELA/9. NOVENO SEMESTRE/1. Minería de datos/MINERÍA DE DATOS (PROFESOR)/DataMining/MachineLearning/SimpleLinearRegression")

![2.png](https://raw.github.com/sebastiansandovalcastro/DataMining/images/unit3/practice1/2.png)

We check again the current directory in order to confirm the change.

	#Se utiliza para obtener el directorio actual (confirmación del cambio).
	getwd()

![3.png](https://raw.github.com/sebastiansandovalcastro/DataMining/images/unit3/practice1/3.png)

Finally, we import the _Salary_Data.csv_ file with the _read.csv()_ function, and we save it in the dataset titled "_dataset_".

	#Importación de dataset Salary_Data.csv en variable "dataset".
	dataset <- read.csv('Salary_Data.csv')

![4.png](https://raw.github.com/sebastiansandovalcastro/DataMining/images/unit3/practice1/4.png)

We use the library _caTools_ to split the dataset "_dataset_" in two by the column "_Salary_". We named the first split as "_training_set_" with all the TRUE values, and we named the second split as "_test_set_" with all the FALSE values.

	#Se divide a "dataset" en "training_set" (split = TRUE) y "test_set" (split = FALSE), utilizando la librería "caTools" para hacer el split.
	library(caTools)
	set.seed(123)
	split <- sample.split(dataset$Salary, SplitRatio = 2/3)
	training_set <- subset(dataset, split == TRUE)
	test_set <- subset(dataset, split == FALSE)

![5.png](https://raw.github.com/sebastiansandovalcastro/DataMining/images/unit3/practice1/5.png)

We fit the simple linear regression to "_training_set_". We put the data in "_regressor_" and make a summary of that info with "_sumarry()_' function.

	#Ajustando la regresión lineal simple a "training_set".
	regressor = lm(formula = Salary ~ YearsExperience,
				   data = dataset)
	summary(regressor)

![6.png](https://raw.github.com/sebastiansandovalcastro/DataMining/images/unit3/practice1/6.png)

And we predict the result of "_test_set_" with "_predict()_" function, using the "_regressor_" info, saving the prediction in "_y_predict_".

	#Prediciendo los resultados de "test_set".
	y_pred = predict(regressor, newdata = test_set)

![7.png](https://raw.github.com/sebastiansandovalcastro/DataMining/images/unit3/practice1/7.png)

We plot the "_training_set_" results with "_ggplot()_" function. The years of experience in the x axe and the salary in the y axe, both from "_training_set_". We represent that info with red dots and plot a blue line with the years of experience in the x axe and the prediction on the y axe, both from "_training_set_" too.

	#Visualizando los resultados de "training_set".
	library(ggplot2)
	ggplot() +
	  geom_point(aes(x=training_set$YearsExperience, y=training_set$Salary),
				 color = 'red') +
	  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)),
				color = 'blue') +
	  ggtitle('Salary vs Experience (Training Set)') +
	  xlab('Years of experience') +
	  ylab('Salary')

![8.png](https://raw.github.com/sebastiansandovalcastro/DataMining/images/unit3/practice1/8.png)

And finally we plot the "_test_set_" results with "_ggplot()_" function. The years of experience in the x axe and the salary in the y axe, both from "_test_set_". We represent that info with red dots and plot a blue line with the years of experience in the x axe and the prediction on the y axe, both from "_training_set_" information.

	#Visualizando los resultados de "test_set".
	ggplot() +
	  geom_point(aes(x=test_set$YearsExperience, y=test_set$Salary),
				 color = 'red') +
	  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)),
				color = 'blue') +
	  ggtitle('Salary vs Experience (Test Set)') +
	  xlab('Years of experience') +
	  ylab('Salary')

![9.png](https://raw.github.com/sebastiansandovalcastro/DataMining/images/unit3/practice1/9.png)