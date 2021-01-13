# PRACTICE 1 - GGPLOT() FUNCTIONS

In this practice, we'll use a default dataset called "mtcars" where we'll see differents functions about the library ggplot.

In the following link shows the explication of dataset and its variables from "mtcars":

[mtcars dataset](http://rstudio-pubs-static.s3.amazonaws.com/61800_faea93548c6b49cc91cd0c5ef5059894.html "mtcars dataset")

The basic elements of ggplot are:

- **ggplot():** specify the data.
- **geom_point():** the geometry or chart type can be in many ways.
- **aes():** "aesthetic", as the variables will be displayed.
- **facet_grid():** shared charts.

_The ggplot elements are joined with the +_

## FUNCTIONS

### FUNCTION #1

**1) Function geom_histogram():** Used to create a histogram, where the design varies depending on the other functions used:

- _binwidth_ --> Bar widht.
- _alpha_ --> This function defines the level of transparency in the bars.
- _position_ --> This function is to identify differences between the positioned bars.
- _bins_ --> This function cuts points in vector x into evenly distributed groups. Basically limits the number of classes.
- _fill_ --> This function fill the bars with a color to identify. 
- _factor_ --> Factors are the data objects which are used to categorize the data and store it as levels.

Example:

	ggplot(data = mtcars) + geom_histogram(aes(x=qsec,fill=factor(am)),bins=10, position = "identity",alpha = 0.8, binwidth=0.8)

![1.png](https://raw.github.com/sebastiansandovalcastro/DataMining/images/unit2/practice1/1.png)

### FUNCTION #2

**2) Function geom_density():** Used to create a density graph. This graph visualizes the distribution of data interval or continuous time period. This chart is a variation of a histogram that plots the values distributions in order to soften the noise.

Example:

	ggplot(data = mtcars) + geom_density(aes(x=qsec,fill=factor(am)),bins=10, position = "identity",alpha = 0.5)

![2.png](https://raw.github.com/sebastiansandovalcastro/DataMining/images/unit2/practice1/2.png)

### FUNCTION #3

**3) Function geom_point():** This function plots the values in the form of points in the plane.

Example:

	ggplot(mtcars, aes(mpg, qsec)) + geom_point(aes(size = cyl), alpha = 0.4)

Here we use a different function called _size_, this function provides different sizes depending the different values contained in the dataset with the variable _cyl_.

![3.png](https://raw.github.com/sebastiansandovalcastro/DataMining/images/unit2/practice1/3.png)

### FUNCTION #4

**4) Function geom_freqpoly():** This function plots a frequency polygon based on the given axe, in this case, the value _mpg_ on the x axe and the _red_ value for the color of the traced line.

Example:

	ggplot(mtcars, aes(x = mpg)) + geom_freqpoly(col="red")

![4.png](https://raw.github.com/sebastiansandovalcastro/DataMining/images/unit2/practice1/4.png)

### FUNCTION #5

**5) Function geom_boxplot():** This function plots a boxplot based on the given axes, in this case, the values _mpg_ and _qsec_. We use the values of _cyl_ to stablish the size, the 0.4 value in alpha and the color blue for the traced line.

Example:

	ggplot(mtcars, aes(mpg, qsec)) + geom_boxplot(aes(size = cyl), alpha = 0.4, col="blue")

![5.png](https://raw.github.com/sebastiansandovalcastro/DataMining/images/unit2/practice1/5.png)
