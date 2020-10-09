# PRACTICE 3 - DATA SCIENTIST PROBLEM


[TOCM]


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