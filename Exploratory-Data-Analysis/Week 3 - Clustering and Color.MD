#Week 3

###Lesson 1: Hierarchical Clustering

#####1. Hierarchical Clustering (part 1)
* Clustering organizes things that are close into groups
  * How do we define close?
  * How do we group things?
  * How do we visualize the grouping?
  * How do we interpret the grouping?
* Agglomerative
  * Find closest two things
  * Put them together
  * Find next closest  
* Requires
  * A defined distance
  * A merging approach
* Produces
  * A tree showing how close things are to each other
* How to define close?
  * Garbage in -> Garbage out
  * Distance or similarity
    * Continuous - euclidean distance
      * Extends to other dimensions
      * Straight line distance
    * Continuous - correlation similarity
    * Binary - manhattan distance
      * When straight lines are not convenient or possible
      * Longer than a straight line
      * Multiple choices
      * Absolutely value of all the sums of distance
      
#####2. Hierarchical Clustering (part 2)
* `dist()` = returns distances from points; displays in matrix plot
* `hclust()` = returns a cluster dendrogram
```
# Set variables -----------------------------------------------------------
set.seed(1234)
par(mar = c(0,0,0,0))
x <- rnorm(12, mean = rep(1:3, each = 4), sd = 0.2)
y <- rnorm(12, mean = rep(c(1,2,1), each = 4), sd = 0.2)
plot(x, y, col = "blue", pch = 19, cex = 2)
text(x + 0.05, labels = as.character(1:12))

# Find distances ----------------------------------------------------------
dataFrame <- data.frame(x = x, y = y)
dist(dataFrame)

# Grouping and merging ----------------------------------------------------
## 1. Find two points that are the closest
## 2. Create a relationship between them
## 3. Repeat steps 1 and 2 for all remaining point combinations
## 4. Build the dendrogram from bottom up (the relationship between the first two points becomes a new point in a new relationship)
## 5. That new relationship 
dataFrame <- data.frame(x = x, y = y)
distxy <- dist(dataFrame)
hClustering <- hclust(distxy)
plot(hClustering)
```

#####3. Hierarchical Clustering (part 3)
* Pretty dendrograms
```
# myplclust function ------------------------------------------------------
myplclust <- function( hclust, lab=hclust$labels, lab.col=rep(1,length(hclust$labels)), hang=0.1,...){
 ## modifiction of plclust for plotting hclust objects *in colour*!
 ## Copyright Eva KF Chan 2009
 ## Arguments:
 ##    hclust:    hclust object
 ##    lab:        a character vector of labels of the leaves of the tree
 ##    lab.col:    colour for the labels; NA=default device foreground colour
 ##    hang:     as in hclust & plclust
 ## Side effect:
 ##    A display of hierarchical cluster with coloured leaf labels.
 y <- rep(hclust$height,2)
 x <- as.numeric(hclust$merge)
 y <- y[which(x<0)]
 x <- x[which(x<0)]
 x <- abs(x)
 y <- y[order(x)]
 x <- x[order(x)]
 plot( hclust, labels=FALSE, hang=hang, ... )
 text( x=x, y=y[hclust$order]-(max(hclust$height)*hang), labels=lab[hclust$order], col=lab.col[hclust$order], srt=90, adj=c(1,0.5), xpd=NA, ... )}
 
# example -----------------------------------------------------------------
dataFrame <- data.frame(x = x, y = y)
distxy <- dist(dataFrame)
hClustering <- hclust(distxy)
myplclust(hClustering, lab = rep(1:3, each = 4), lab.col = rep(1:3, each = 4))

# heatmap -----------------------------------------------------------------
dataFrame <- data.frame(x = x, y = y)
set.seed(143)
dataMatrix <- as.matrix(dataFrame)[sample(1:12), ]
heatmap(dataMatrix)
```
* [Even prettier dendrograms](http://gallery.r-enthusiasts.com/RGraphGallery.php?graph=79)
* Merging points
* `heatmap()` = creates image plot; rearranges rows and columns according to hierarchical clustering algorithm
* Notes and Further resources
  * Gives an idea of the relationships between varaibles/observations
  * The pricture may be unstable
    * Change a few points
    * Have different missing values
    * Pick a different distance
    * Change the merging strategy
    * Change the scale of points for one variable
  * It is deterministic
  * Choosing where to cut isn't always obvious
  * Should be primarily used for exploration
    * Pick a distance/similarity that makes sense for your problem
