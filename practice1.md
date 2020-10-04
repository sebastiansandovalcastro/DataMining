#-- TWENTY "R" FUNCTIONS -------------------------------------------------------------------------------------------------------------------------------------------------



#-- Function 1 -> substr(string, start = X, stop = Y) ------------------------------------------------------------------------------------------------------------------

#If We have a string value, We can take the character amount that We want from it with the substr() function.

#If We have the next value:

    variable = "Hello World"

#And We want to see just the "Hello" word and toss out the rest of characters, We just need to use:

    substr(variable, start = 1, stop = 5)

#And the result must be the first five characters from the string, in this case, the word "Hello".



#-- Function 2 -> sum(a, b, ..., n) -> sum(vector) -> sum(a, b, vector, ..., n) ------------------------------------------------------------------------------------------

#We can sum a bunch of stored numbers in variables or vectors with the sum() function.

#Here are some examples:

#-- Variables --
    a = 8.5
    b = 2
    c = 5
    vector = c(5,4)

#-- Result = 10.5 --
    sum(a, b)

#-- Result = 15.5 --
    sum(a, b, c)

#-- Result = 9 --
    sum(vector)

#-- Result = 24.5 --
    sum(a, b, c, vector)



#-- Function 3 -> plot(x, y) ---------------------------------------------------------------------------------------------------------------------------------------------

#We can plot in R with plot() function, using numbers, variables, vectors, etc.

#Here is an example:

#-- Variables --

    x = c(1,2,3,4,5,6,7,8,9)
    y = c(1,9,2,8,3,7,4,6,5)

    plot(x, y)



#-- Function 4 -> solve(x,y) ---------------------------------------------------------------------------------------------------------------------------------------------

#This generic function solves the equation a %*% x = b for x, where b can be either a vector or a matrix.

#A simple way to look at it, is that We obtain the division between "y" and "x".

#For example, if We have the next variables:

    x = 100
    y = 700

#And We use the solve() function:

    solve(x,y)

#We must obtain the number 7 as result.



#-- Function 5 -> tolower(string) -> toupper(string) ---------------------------------------------------------------------------------------------------------------------

#This two functions helps to make the characters of a string value in lower or upper characters.

#If We have the next string variable:

    variable = "Harry Potter"

#We can make it all lower with the tolower() fuction, getting as result the string "harry potter" instead of the original:

    tolower(variable)

#Or We can make it all upper with the toupper() function, getting as result the string "HARRY POTTER" instead of the original:

    toupper(variable)



#-- Function 6 -> pie(x) -------------------------------------------------------------------------------------------------------------------------------------------------

#Pie() function is used to plot a bunch of data in a pie graphic. For example, if We have a vector with six numbers on it, We can see this information in a pie chart using the pie() function with the vector as a parameter.

    vector = c(50,30,10,5,3,2)

    pie(vector)



#-- Function 7 -> round(x, n) --------------------------------------------------------------------------------------------------------------------------------------------

#The round() function, rounds the elements of "x" to "n" decimals, for example:

    x = 24.3333333333
    n = 2

    round(x, n)

#In this case, the result must be 24.33



#-- Function 8 -> unique(vector) -----------------------------------------------------------------------------------------------------------------------------------------

#The unique() function is used with vectors or data frames. This function returns a similar object as the used parameter, but the duplicate elements are suppressed. For example:

    x = c(1,1,1,1,1,2,2,2,3,3,3,3,4,4,4,5,5)

    unique(x)

#The result must be a vector, just like the variable given as parameter, but only with the "1,2,3,4,5" values once.



#-- Function 9 -> hist(x) ------------------------------------------------------------------------------------------------------------------------------------------------

#The hist() function is used to plot a frequency histogram of the given parameter, for example:

    x = c(1,2,3,4,5,4,7,8,9)

    hist(x)



#-- Function 10 -> mean(x) -----------------------------------------------------------------------------------------------------------------------------------------------

#The mean() function, obtains the mean of the elements in the given parameter, for example:

    x = c(5,5,4,5,3)

    mean(x)

#The mean, in this case, must be 4.4.