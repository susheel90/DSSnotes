#Week 2 - Plotting Systems

###Lesson 1 - laticce

#####1. Lattice Plotting System (part 1)
* `library(lattice)` = builds on top of `library(grid)`
* Create plot in one function call
* Creates an object of class trellis
* Autoprints that trellis object to the graphic device (window screen)
* Common functions:
  * `xyplot()`
  * `bwplot()`
  * `histogram()`
  * `stripplot()`
  * `dotplot()`
  * `splom()`
  * `levelplot()/contourplot()`
* `xyplot(y ~ x | f * g, data, layout)`
  * `y` = y-axis variable
  * `x` = x-axis variable
  * `f/g` = conditioning variables; optional
  * `data` = data frame or list where the `y` and `x` variables can be found
  * `layout` =


#####2. Lattice Plotting System (part 2)
* Panel functions controls what happens inside each panel of the plot
* Cannot use base plotting system functions with lattice
* Ideal for conditioned plots (i.e. using factors to break apart a series of data along an index of factors)

###Lesson 2 - ggplot2

#####1. ggplot2 (part 1)
* Implementation of the *Grammar of Graphics* by Leland Wilinson
* `ggplot2` written by Hadley Wickham
* A "third" graphics system for R (along with `base` and `lattice`)
* `qplot()` = generates graphics for data from a data frame; factor variables indicate subsets; facets split separate multiple dataset in a single plot into multiple plots with a single dataset
  * Scatter plot = `qplot(y, x, data =, colors =, geom =, facets =)`
    * `facets` = optional technique to split multiple datasets on a single plot into multiple plots with single datasets
  * Histogram = `qplot(x, data =, fill =)`
    * Facets = `qplot(x, data =, facets =)`
  * Smoothed Line = `geom_smooth()`
* `ggplot()` = 
