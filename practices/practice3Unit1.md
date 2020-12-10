# PRACTICE 3 - DATA SCIENTIST PROBLEM

**Scenario:** You are a Data Scientist working for a consulting firm. One of your colleagues from the Auditing Department has asked you to help them assess the financial statement of organization X.


You have been supplied with two vector of data: mounthly revenue and expenses for the financial year in quiestion. Your task is to calculate the following financial matrics:


- Profit for each mounth.
- Profit after tax for each month (the tax rate is 30%).
- Profit margin for each month - equal to profit after tax divided by revenue.
- Good months - where the profit after tax was greater than the mean for the year.
- Bad months - where the profit after tax was less then the mean for years.
- The best month - where the profit after tax was max for the year.
- The worst month - where the profit after tax was min for the year.


**1. All results need to be presented as vectors.**


**2. Results for dollar values need to be calculate with $0.01 precision, but need to be presented in Units of $1,000(i.e. 1k) with no decimal point.**


**3. Results for the profit margin ratio needed to be presented in units of % with no decimal points.**


**Note:** Your collegue has warned you that it is okay for tax for any given month to be negative (in accounting terms, negative tax translates into a deferred tax asset).


**Hint 1:**


Use:
- round()
- mean()
- max()
- min()


**Data:**


	revenue = c(14574.49, 7606.46, 8611.41, 9175.41, 8058.65, 8105.44, 11496.28, 9766.09, 10305.32, 14379.96, 10713.97, 15433.50)


	expenses = c(12051.82, 5695.07, 12319.20, 12089.72, 8658.57, 840.20, 3285.73, 5821.12, 6976.93, 16618.61, 10054.37, 3803.96)


## SOLUTION


### 1. PROFIT


The profit must be the difference between the revenues and the expenses.


We assign the result in the "profit" variable.


	profit = revenue - expenses
	print(profit)


### 2. TAX


The tax must be the 30% of the profit.


We assign the result in the "tax" variable and round to 2 decimals with the round() function.


	tax = round(0.30 * profit, 2)
	print(tax)


### 3. PROFIT AFTER TAX


The remaining profit after the tax deduction must be the difference between the profit and the tax calculated before.


We assign the result in the "profitAfterTax" variable.


	profitAfterTax = profit - tax
	print(profitAfterTax)


### 4. PROFIT MARGIN


The profit margin is calculated by the division between the profit after taxes over the revenue, and the result is multiplied by 100 to get the percent.


Hoping to avoid the decimals in the final result, the result of the division must be round to 2 decimals, right before the multiplication by 100.


We assign the result in the "profitMargin" variable.


	profitMargin = round(profitAfterTax / revenue, 2) * 100
	print(profitMargin)


### 5. MEAN OF THE PROFIT AFTER TAX


The mean of the profit after tax is calculated with the mean() function, using the "profitAfterTax" variable (calculated before) as a parameter.


We assign the result in the "meanProfitAfterTax" variable.


	meanProfitAfterTax = mean(profitAfterTax)
	print(meanProfitAfterTax)


### 6. GOOD MONTHS


The good months are the months where their profits after taxes are above the mean of the profit after tax.


We assign the result in the new boolean variable "goodMonths".


	goodMonths = (profitAfterTax > meanProfitAfterTax)
	print(goodMonths)


### 7. BAD MONTHS


The bad months are the months where their profits after taxes are below the mean of the profit after tax. They are the opposite to the good months too though,


We can obtain the result doing the same thing that We did before, with a few changes of course:


	badMonths = (profitAfterTax < meanProfitAfterTax)
	print(badMonths)


Or We can use the "!" operator to get the opposite of the good months as result.


	badMonths = !goodMonths
	print(badMonths)


### 8. MAX PROFIT AFTER TAX


We can obtain the max profit after tax using the max() function with the "profitAfterTax" variable as a parameter.


We assign the result in the "maxProfitAfterTax" variable to use it later.


	maxProfitAfterTax = max(profitAfterTax)
	print(maxProfitAfterTax)


### 9. MIN PROFIT AFTER TAX


We can obtain the min profit after tax using the min() function with the "profitAfterTax" variable as a parameter.


We assign the result in the "minProfitAfterTax" variable to use it later.


	minProfitAfterTax = min(profitAfterTax)
	print(minProfitAfterTax)


### 10. BEST MONTH


In order to obtain the best month, We need to compare all the profits after taxes with the max profit after tax value.


The month that matches with the max value will be the best month and We assign that result in the "bestMonth" variable.


	bestMonth = (profitAfterTax == maxProfitAfterTax)
	print(bestMonth)


### 11. WORST MONTH


In order to obtain the worst month, We need to compare all the profits after taxes with the min profit after tax value.


The month that matches with the min value will be the worst month and We assign the result in the "worstMonth" variable.


	worstMonth = (profitAfterTax == minProfitAfterTax)
	print(worstMonth)


### 12. ALL CALCULATIONS IN UNITS OF ONE THOUSAND DOLLARS


To convert all the calculations made in units of 1000 dollars, We need to divide the variable over 1000, rounding to 0 with the round() function in order to suppress the decimals.


We assign the result in new variables and We visualize them all with the print() function.


	revenue1000 = round(revenue / 1000, 0)
	expenses1000 = round(expenses / 1000, 0)
	profit1000 = round(profit / 1000, 0)
	profitAfterTax1000 = round(profitAfterTax / 1000, 0)
	
	print(revenue1000)
	print(expenses1000)
	print(profit1000)
	print(profitAfterTax1000)
	print(profitMargin)
	print(goodMonths)
	print(badMonths)
	print(bestMonth)
	print(worstMonth)


### 13. MATRIX TABLE VISUALIZATION


To visualize the information as a matrix table, We need to use the rbind() function with the obtained values as parameters.


We assign the result in the "Matrix" variable and We print it to see the table.


	Matrix = rbind(
	  revenue1000,
	  expenses1000,
	  profit1000,
	  profitAfterTax1000,
	  profitMargin,
	  goodMonths,
	  badMonths,
	  bestMonth,
	  worstMonth
	)
	
	print(Matrix)
