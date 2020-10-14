# PRACTICE 1 - THE LAW OF LARGE NUMBERS FOR N RANDOM NORMALLY DISTRIBUTED NUMBERS


### Test the Law Of Large Numbers for N random normally distributed numbers with mean = 0, stdev=1:


##### Create an R script that will count how many of these numbers fall between -1 and 1 and divide by the total quantity of N
##### You know that E(X) = 68.2%
##### Check that Mean(Xn)->E(X) as you rerun your script while increasing N


###### 1. Initialize sample size

	N = 1:100 //N contains numbers from 1 to 100.


###### 2. Initialize counter

	c = 1 //Counter initialized in 1.


###### 3. Loop for(i in rnorm(size))

###### 4. Check if the iterated variable falls

###### 5. Increase counter if the condition is true

	//For created to generate N(1:100) random normally distributed numbers.
	for(i in rnorm(N))
	{
		//If one of those numbers is lesser than 1 or more than -1, then the counter increments.
		if(i < 1 & i > -1)
		{
			c = c + 1
		}
	}


###### 6. return a result <- counter / N

	result = c/N
	result
	
	plot(result)

![ScreenShot](https://raw.github.com/sebastiansandovalcastro/DataMining/tree/images/unit1/practice1plot.png) 