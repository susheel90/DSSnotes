#Week 1 - Graphs & Plotting

###Lesson 1 - Graphs

#####Principles of Analytic Graphics

Edward Tufte (2006) Beautiful Evidence  
*  Show comparisons  
  *  Evidence of one hypothesis is relative to another competing hypothesis.  
  *  Always ask "Compared to "What?"  
*  Show causality, mechanism, explanation, systemic structure  
  *  What is your causal framework for thinking about a question?  
*  Show multivariate data (show as much data as possible on a chart)  
  *  Multivariate = more than 2 variables  
  *  The real world is multivariate  
  *  Need to "escape flatland"  
*  Integration of evidence  
  *  Completely integrate words, numbers, images, diagrams  
  *  Data graphics should make use of many modes of data presentation  
  *  Don't let the tool drive the analysis  
*  Describe and document the evidence with appropriate labels, scales, scources, etc  
  *  A data graphic should tell a complete story that is credible  
  *  Content is king  
  *  Analytical presentations ultimately stand or fall depending on the quality, relevance, and integrity of their content  

######Exploratory Graphs (part 1)

*  Why do we use graphs
  *  To understand data properties
  *  To find patterns in data
  *  To suggest modeling strategies
  *  To "debug" analyses
  *  To communicate results
*  Characteristics of exploratory graphs
  *   Made quickly
  *   Large number made
  *   Goal is personal understanding
  *   Axes/legends are cleaned up later on
  *   Color/size are primarily used for information
* Boxplot = `boxplot(data, col = "color"); abline(h = "horz_line", v = "vert_line")` 
* Histogram = `hist(data, col = "color"); rug(data)`
  *  Avoid too many bars which may create a noisy graph
* Barplot = `barplot(data)`

#####Exploratory Graphs (part 2)

*  Two dimensions
  *  Multiple/overlayed 1-D plots (lattic/ggplot2)
* Plot paramaters = `par(mfrow = c(rows, cols), mar = c(bottom, left, top, right))` 
* Histogram = `hist(data$col1[data$col3 == "value", $col1], col = "color"]` | `subset(data$col1, data$col3 == "value")`
* Grid = `with(data, plot(col1, col5))` | `plot(data$col1, data$col5)`
* Summary
  * Exploratory plots are "quick and dirty"
  * Let you summarize data and highlight any broad features
  * Explore basic questions and hypothesis
  * Suggest modeling strategies for the "next step"

###Lesson 2 - Plotting

#####Plotting Systems in R

* The Base plotting system (`library(Graphics)`)
  * "Artist's palette" model
  * Start with blank canvas and build up from there
  * Start with plot function (or similar)
  * Use annotation functions to add/modify (text, lines, points, axis)
  * Consequences:
    * Convenient, mirrors how we think of building plots and analyzing data
    * Can't go back once plot has started (i.e. to adjust margins); need to plan in advance
    * Difficult to "translate" to others once a new plot has been created (no graphical "language")
    * Plot is just a series of R commands
* The Lattic system (`library(lattice)`)
  * Pros
    * Plots are created with a single function call (xyplot, bwplot, etc)
    * Most useful for conditioning types of plots: Looking at how y changes with x across levels of z
    * Things like margins/spacing set automatically because entire plot is specified at once
    * Good for putting many many plots on a screen
  * Cons
    * Sometimes awkward to specify an entire plot in a single function call
    * Annotation in plot is not especially intuitive
    * Use of panel functions and subscripts difficult to wield and requires intense preparation
    * Cannot "add" to the plot once it is created
  * Functions
    * `xyplot(x-axis ~ y-axis | grouping, data = data frame, layout = c(grouping specifications))`
      * `x-axis` = column to populate the x-axis of a plot
      * `y-axis` = column to populate the y-axis of a plot
      * `grouping` = column to index/group the x-/y-axises
      * `data` = data frame or table that has data to populate the plot
      * `layout` = dimensions of `grouping`
* The ggplot2 system (`library(ggplot2)`)
  * Pros
    * Splits the difference between base and lattice in a number of ways
    * Automatically deals with spacings, text, tiltes but also allows you to annotate by "adding" to a plot
    * SUperficial similarity to lattice but generally easier/more intuitive to use
    * Default mode makes many choices for you (but you can still customize to your heart's desire)
  * Functions
    * `qplot(x-axis, y-axis, data = data frame)`
      * `x-axis` = column to populate the x-axis of a plot
      * `y-axis` = column to populate the y-axis of a plot
      * `data` = data frame or table that has data to populate the plot

#####Base Plotting System (part 1)
* Plot = `plot(x-axis, y-axis)`
* Histogram = `hist(data$col1[data$col3 == "value", $col1], col = "color"]` | `subset(data$col1, data$col3 == "value")`
* Boxplot = `boxplot(x-axis ~ y-axis, data = data frame, xlab = x-label, ylab = y-label, col = "color"); abline(h = "horz_line", v = "vert_line")` 
* Parameters
  * `pch` = the plotting symbol (i.e. circle)
  * `lty` = the line type (i.e. solid)
  * `lwd` = the line width, specified as an integer multiple
  * `col` = the plotting color, specified as a number, string, or hex code
  * `xlab` = character string for the x-axis label
  * `ylab` = character string for the y-axis label
  * `par()`
    * `las` = the orientation fo the axis labels on the plot
    * `bg` = the background color
    * `mar` = the margin size
    * `oma` = the outer margin size
    * `mfrow` = the number of plots per row, column (ROW-wise)
    * `mfcol` = the number of plots per row, column (COLUMN-wise)
