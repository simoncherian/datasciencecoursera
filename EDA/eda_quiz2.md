##Exploratory Data Analysis Quiz 2

- Under the lattice graphics system, what do the primary plotting functions like xyplot() and bwplot() return?
	- an object of class "trellis"

- What is produced by the following code?
	`library(nlme)
	`library(lattice)
	`xyplot(weight ~ Time | Diet, BodyWeight)
	- A set of 3 panels showing the relationship between weight and time for each diet.

- Annotation of plots in any plotting system involves adding points, lines, or text to the plot, in addition to customizing axis labels or adding titles. Different plotting systems have different sets of functions for annotating plots in this way. Which of the following functions can be used to annotate the panels in a multi-panel lattice plot?
	- panel.lmline()

- The following code does NOT result in a plot appearing on the screen device.
	`library(lattice)
	`library(datasets)
	`data(airquality)
	`p <- xyplot(Ozone ~ Wind | factor(Month), data = airquality)
	- The object 'p' has not yet been printed with the appropriate print method.

- In the lattice system, which of the following functions can be used to finely control the appearance of all lattice plots?
	- trellis.par.set()

- What is ggplot2 an implementation of?
	- the Grammar of Graphics developed by Leland Wilkinson

- Load the `airquality' dataset form the datasets package in R.
	`library(datasets)
	`data(airquality)
	- airquality = transform(airquality, Month = factor(Month))
	  qplot(Wind, Ozone, data = airquality, facets = . ~ Month)

- What is a geom in the ggplot2 system?
	- a plotting object like point, line, or other shape

- When I run the following code I get an error:
	`library(ggplot2)
	`g <- ggplot(movies, aes(votes, rating))
	`print(g)
	- ggplot does not yet know what type of layer to add to the plot.

- The following code creates a scatterplot of 'votes' and 'rating' from the movies dataset in the ggplot2 package. After loading the ggplot2 package with the library() function, I can run **qplot(votes, rating, data = movies)** How can I modify the the code above to add a smoother to the scatterplot?
	- qplot(votes, rating, data = movies) + geom_smooth()