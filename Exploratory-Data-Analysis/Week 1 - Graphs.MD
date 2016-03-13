#Week 1 - Graphs

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
* Histogram = `hist(data$col1[data$col3 == "value", $col1], col = "color"]` -or- `subset(data$col1, data$col3 == "value")`
