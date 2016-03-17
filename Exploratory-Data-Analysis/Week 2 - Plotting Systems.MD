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
      * `.` = data frame declared with `data =` argument
      * `~` = tilde expansion for expressing which column/variable of the data frame to apply factor-based subsetting
  * Histogram = `qplot(x, data =, fill =)`
    * Facets = `qplot(x, data =, facets =)`
  * Smoothed Line = `geom_smooth()`
* `ggplot()` = requires a geom (i.e. `geom_smooth()`, `geom_point()`, etc) to display a plot

#####3. ggplot2 (part 3)
* Basic `ggplot2` components
  * Data frame = data source
  * Aesthetic mapping = how data are mapped to color, size, etc
  * Geoms = geometric objects like points, lines, etc
  * Facets = multiple panels (plots) for a subsetted (conditional) plot
  * Stats = statistical transformations like binning, quantiles, smoothing, etc
  * Scales = scale of the aesthetic mapping
  * Coordinate System = cartesian
* Plots are built in layers
* `ggplot()` = requires a geom (i.e. `geom_smooth()`, `geom_point()`, etc) to display a plot
 

#####4. ggplot2 (part 4)
* `ggplot2()`
  * `facet_grid(. ~ variable/column)`
  * `geom_point(color =, size =, alpha =)` = plots points; does not require arguments to populate
  * `geom_smooth(method =, size =, linetype =, se =)` = applies a smoothed line; requires a `method` argument to specify the type of smoothed line
  * `ggtitle()`
  * `xlab()`
  * `ylab()`
  * `labs()`
  * `theme()`
  * 
  
#####5. ggplot2 (part 5)
* Setting axis limits (i.e. y-axis)
  * `ylim = c(min, max)`
