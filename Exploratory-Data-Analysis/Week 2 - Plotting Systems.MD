#Week 2 - Plotting Systems

#####Lattice Plotting System (part 1)
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


#####Lattice Plotting System (part 2)
* Panel functions controls what happens inside each panel of the plot
* Cannot use base plotting system functions with lattice
* Ideal for conditioned plots (i.e. using factors to break apart a series of data along an index of factors)
