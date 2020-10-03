#-- TWENTY "R" FUNCTIONS -------------------------------------------------------------------------------------------------------------------------------------------------



#-- Function 1 -> substr(variable, start = X, stop = Y) ------------------------------------------------------------------------------------------------------------------

#If We have a string value, We can take the character amount that We want from it with the substr() function.

#If We have the next value:

    string = "Hello World"

#And We want to see just the "Hello" word and toss out the rest of characters, We just need to use:

    substr(string, start = 1, stop = 5)

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



    #-- Function 3 -> 