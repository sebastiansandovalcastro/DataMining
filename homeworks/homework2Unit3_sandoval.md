# HOMEWORK 2 - SCALE FUNCTION AND TABLE FUNCTION (SANDOVAL)

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

**UNIT 3**

**HOMEWORK 2 - SCALE FUNCTION AND TABLE FUNCTION**


**STUDENT**

SANDOVAL CASTRO SEBASTIÁN	16212076


Tijuana, Baja California, november 29, 2020.

</div>

# SCALE FUNCTION AND TABLE FUNCTION

## Scale() function

The scale() function in R Langauge is a generic function which centers and scales the columns of a numeric matrix. The center parameter takes either numeric alike vector or logical value.

- If the numeric vector is provided, then each column of the matrix has the corresponding value from center subtracted from it.

- If the logical value is provided TRUE, then column means of the matrix is subtracted from their corresponding columns.

- The scale takes either numeric alike vector or logical value.

- When provided with a numeric like vector, then each column of the matrix is divided by the corresponding value from scale.

- If the logical value is provided in scale parameter, then centered columns of the matrix is divided by their standard deviations, and the root mean square otherwise.

- If FALSE, no scaling is done on the matrix.

> Syntax:
scale(x, center = TRUE, scale = TRUE)

> Parameters:
x: represents numeric matrix
center: represents either logical value or numeric alike vector equal to the number of x
scale: represents either logical value or numeric alike vector equal to the number of x

	#Create matrix
	mt <- matrix(1:10, ncol = 5)

	#Print matrix
	cat("Matrix:\n")
	print(mt)

	#Scale matrix with default arguments
	cat("\nAfter scaling:\n")
	scale(mt)

## Table() function

Table function in R _table()_, performs categorical tabulation of data with the variable and its frequency. _Table()_ function is also helpful in creating Frequency tables with condition and cross tabulations.

	#Frequency table with table() function in R
	table(iris$Species)
	
	#Frequency table with with proportion using table() function in R
	table1 = as.table(table(iris$Species))
	prop.table(table1)
	
	#Frequency table with condition using table function in R
	table(iris$Sepal.Length>5.0)

## Library ElemStatLearn

Data sets, functions and examples from the book: "The Elements of Statistical Learning, Data Mining, Inference, and Prediction" by Trevor Hastie, Robert Tibshirani and Jerome Friedman.

## References

[1] U. Kumar. (2020). Scale the Columns of a Matrix in R Programming – scale() Function. Recuperado el 29 de noviembre de 2020, de: 
https://www.geeksforgeeks.org/scale-the-columns-of-a-matrix-in-r-programming-scale-function/#:~:text=scale()%20function%20in%20R,from%20center%20subtracted%20from%20it.

[2] Datasciencemadesimple. (-). Table Function in R – Frequency table in R & cross table in R. Recuperado el 29 de noviembre de 2020, de:
https://www.datasciencemadesimple.com/table-function-in-r/

[3] Cran. (2014). CRAN - Package ElemStatLearn. Recuperado el 29 de noviembre de 2020, de:
https://cran.microsoft.com/snapshot/2014-12-11/web/packages/ElemStatLearn/index.html
