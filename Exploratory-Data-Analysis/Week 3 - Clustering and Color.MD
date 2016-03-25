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
  *Requires
    * A defined distance
    * A merging approach
  * Produces
    * A tree showing how close things are to each other
* How to define close?
  * Garbage in -> Garbage out
  * Distance or similarity
    * Continuous - euclidean distance
      * Extends to other dimensions
    * Continuous - correlation similarity
    * Binary - manhattan distance
      * When straight lines are not convenient or possible
      * Longer than a straight line
      * Multiple choices
      
#####2. Hierarchical Clustering (part 2)
* `dist()` = returns distances from points; displays in matrix plot
* `hclust()` = returns a cluster dendrogram

#####3. Hierarchical Clustering (part 3)
* Merging points
* `heatmap()` = creates image plot; rearranges rows and columns according to hierarchical clustering algorithm
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
