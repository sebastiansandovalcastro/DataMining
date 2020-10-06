#TWENTY "R" FUNCTIONS

###Function 1
**substr(string, start = X, stop = Y)**

If We have a string value, We can take the character amount that We want from it with the substr() function.
If We have the next value:

    variable = "Hello World"

And We want to see just the "Hello" word and toss out the rest of characters, We just need to use:

   	substr(variable, start = 1, stop = 5)

And the result must be the first five characters from the string, in this case, the word "Hello".

###Function 2
**sum(a, b, ..., n) -> sum(vector) -> sum(a, b, vector, ..., n)**

We can sum a bunch of stored numbers in variables or vectors with the sum() function.
Here are some examples:

	Variables
		a = 8.5
		b = 2
		c = 5
		vector = c(5,4)

	Result = 10.5
		sum(a, b)

	Result = 15.5
		sum(a, b, c)

	Result = 9
		sum(vector)

	Result = 24.5
		sum(a, b, c, vector)

###Function 3
**plot(x, y)**

We can plot in R with plot() function, using numbers, variables, vectors, etc.
Here is an example:

	Variables
		x = c(1,2,3,4,5,6,7,8,9)
		y = c(1,9,2,8,3,7,4,6,5)
		
		plot(x, y)

###Function 4
**solve(x,y)**

This generic function solves the equation a %*% x = b for x, where b can be either a vector or a matrix.
A simple way to look at it, is that We obtain the division between "y" and "x".
For example, if We have the next variables:

	x = 100
	y = 700

And We use the solve() function:

	solve(x,y)

We must obtain the number 7 as result.

###Function 5
**tolower(string) -> toupper(string)** 

This two functions helps to make the characters of a string value in lower or upper characters.
If We have the next string variable:

	variable = "Harry Potter"

We can make it all lower with the tolower() fuction, getting as result the string "harry potter" instead of the original:

	tolower(variable)

Or We can make it all upper with the toupper() function, getting as result the string "HARRY POTTER" instead of the original:

	toupper(variable)

###Function 6
**pie(x)**

Pie() function is used to plot a bunch of data in a pie graphic. For example, if We have a vector with six numbers on it, We can see this information in a pie chart using the pie() function with the vector as a parameter.

	vector = c(50,30,10,5,3,2)
	
	pie(vector)

###Function 7
**round(x, n)**

The round() function, rounds the elements of "x" to "n" decimals, for example:

	x = 24.3333333333
	n = 2
	
	round(x, n)

In this case, the result must be 24.33.

###Function 8
**unique(vector)** 

The unique() function is used with vectors or data frames. This function returns a similar object as the used parameter, but the duplicate elements are suppressed. For example:

	x = c(1,1,1,1,1,2,2,2,3,3,3,3,4,4,4,5,5)
	
	unique(x)

The result must be a vector, just like the variable given as parameter, but only with the "1,2,3,4,5" values once.

###Function 9
**hist(x)**

The hist() function is used to plot a frequency histogram of the given parameter, for example:

	x = c(1,2,3,4,5,4,7,8,9)
	
	hist(x)

###Function 10
**mean(x)**

The mean() function, obtains the mean of the elements in the given parameter, for example:

	x = c(5,5,4,5,3)
	
	mean(x)

The mean, in this case, must be 4.4.

###Function 11
**cat()**

This function prints arguments after execute variables of type string, double, among others.

	x <- 7
	cat (x)
	7 
	y <- "Pamela"
	cat(y,"tiene",x,"perros")
	Pamela tiene 7 perros #Result
	> cat(y,"tiene\n",x,"perros") #\n divides the expression into two lines
	Pamela tiene
	 7 perros #Result

###Function 12
**max()**

This function show us the maximum of the elements of x.

	x <- c(23,1,-2,56,8,1.55) #Create a example vector
	max(x) #Apply function max for look the maximum number of the vector
	[1] 56 #Result

###Function 13
**min()**

This function show us the minimum of the elements of x.

	x <- c(23,1,-2,56,8,1.55) #Create a example vector
	min(x) #Apply function max for look the maximum number of the vector
	[1] -2 #Result

###Function 14
**range()**

This function show us the minimun and maximum of the elements of the vector created.

	x <- c(23,1,-2,56,8,1.55) #Create a example vector
	range(x)#Apply function range
	[1] -2 56 #Result

###Function 15
**rnorm(1)**

The rnorm(1) function generates a random sampled data from a normal distribution with mean 0 and variance 1.

	n <- 2 + rnorm(1)
	n
	[1] 2.577821

###Function 16
**ls()**

The function simply lists the objects in memory: only the names of the same.

	name <- "Stephany"; n1 <- 8; n2 <- 14; x <- 0.5; y = "Pamela"
	ls() #Apply function ls
	[1] "n"    "n1"   "n2"   "name" "x" "y" #Result
	ls.str() #This function shows some details of the objects in memory.
	n :  num 2.58
	n1 :  num 8
	n2 :  num 14
	name :  chr "Stephany"
	x :  num 0.5
	y :  chr "Pamela"

If you want to list only those objects that contain a particular character, you can use the pattern option (which can be abbreviated as pat):

	> ls(pat = "a") 
	[1] "name"
	> ls(pat ="s")
	character(0)

###Function 17
**paste()**

This function concatenate vectors after converting to character.

	paste("Pamela",16212034)
	[1] "Pamela 16212034"

###Function 18
**barplot()**

This function shows a histogram of the values of x.

	x1 <- c(1,2,3,4,5,6,6) #Create a example vector.
	barplot(x1)

###Function 19
**merge()**

This function merges two data frames by common columns or row names.

	x <- c(1,2,3,4,5,6)
	y <- c(1,8,12,15)
	merge (x,y)
	#Result 
	  x  y
	1  1  1
	2  2  1
	3  3  1
	4  4  1
	5  5  1
	6  6  1
	7  6  1
	8  1  8
	9  2  8
	10 3  8
	11 4  8
	12 5  8
	13 6  8
	14 6  8
	15 1 12
	16 2 12
	17 3 12
	18 4 12
	19 5 12
	20 6 12
	21 6 12
	22 1 15
	23 2 15
	24 3 15
	25 4 15
	26 5 15
	27 6 15
	28 6 15

###Function 20
**Points()**

This function adds points to the graph.

	x <- c(1,2,3) #We'll add these elements as points
	x1 <- c(1,1,1,2,3,4) #These elements will be our histogram.
	hist(x1)
	points(x)