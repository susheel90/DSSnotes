#Week 3

* [Subsetting and Sorting](https://github.com/SeaSmith1018/DSSnotes/blob/master/Getting-and-Cleaning-Data/Week3.MD#subsetting-and-sorting)
* [Summarizing Data](https://github.com/SeaSmith1018/DSSnotes/blob/master/Getting-and-Cleaning-Data/Week3.MD#summarizing-data)
* [Creating New Variables](https://github.com/SeaSmith1018/DSSnotes/blob/master/Getting-and-Cleaning-Data/Week3.MD#creating-new-variables)
* [Reshaping Date](https://github.com/SeaSmith1018/DSSnotes/blob/master/Getting-and-Cleaning-Data/Week3.MD#reshaping-data)
* [Managing Data Frames with dplyr](https://github.com/SeaSmith1018/DSSnotes/blob/master/Getting-and-Cleaning-Data/Week3.MD#managing-data-frames-with-dplyr---basic-tools)
* [Merging Data](https://github.com/SeaSmith1018/DSSnotes/blob/master/Getting-and-Cleaning-Data/Week3.MD#merging-data)

###Subsetting and Sorting
* `[]` = subets the specified element in the object
  * `[which(), ]` = returns rows which meet the predicate without `NA` place holders
  * `[order(), ]` = orders the rows by the specified variable (column/atomic vector)
* `library(plyr)`
  * `arrange()` = will order specified object by the specified variable
    * `desc()` = will order in descending order
* Add new columns
  * `df$new_col <- c(data)` = add a new column
  * `new_df <- cbind(old_df, new_col)` = add a new column

###Summarizing Data
* `head()` = preview first several rows
* `tail()` = preview last several rows
* `summary()` = summarize factors (variables) by group (mean, max, min, etc)
* `quantile()` = summarize data by qunatile (top 25%, top 50%, etc)
  * `probs =` = define the quantiles (i.e. from 0-100% by 10 `probs = seq(0, 1, by = .1)`
* `sum(is.na(data))` = checks for the number of missing values
  * `colSums(is.na(data))` = checks for the number of missing values by column
* `any(is.na(data)) = returns `TRUE` or `FALSE`
* `all(is.na(data)) = returns `TRUE` or `FALSE`
* `table(df$col %in% c(data))` = returns whether or not the condition to the right of `%in%` is present in the specified column of the data frame; returns a logicla vector
  * `df[df$col %in% c(data)]` = returns rows where the predicate is `TRUE`
* `xtab()` =

###Creating New Variables
* Sequences
  * `seq()` = min, max, step, and length
  * `seq(along = variable)` = create index vector with length `length(variable)`
* Binary
  * `ifelse(predicate, <true>, <false>)`
* Categorical
  * `cut()` = breaks a vector (data frame column) into sections (called `breaks`) | [More](http://www.r-bloggers.com/r-function-of-the-day-cut/)
    * `c1 <- cut(df$col, breaks = 5)` = will break `df$col` into 5 equal sections (from min to max); will return the break/range that a
    * value falls into
      * `table(c1)` = will return the count for the 5 breaks
  * `library(Hmisc)` = `cut2()`
* Factor
  * `df$new_col <- factor(df$some_col, levels = c())`
* Mutate
  * `library(plyr)`

###Reshaping Data
* `library(reshape2)`
  * `melt()`
    * `id` = factor (character) variables
    * `measure.vars` = numeric variables
* `tapply()`
  * `X` = vector to apply `FUN` to
  * `INDEX` = index (vector in same table as `X`) to use when applying `FUN` to `X`
  * `FUN` = function to apply
* `split()`
  * `x` = vector to be divided into groups
  * `f` = vector index along which `x` will be divided
  * `split(mtcars$hp, mtcars$cyl)` = will breakdown the horsepower into three groups (the number of cyclinder groups - 4, 6, and 8)

###Managing Data Frames with dplyr - Basic Tools
* `select()` = returns a subset fo the columns of a data frame | `SELECT`
* `filter()` = extracts a subset of rows from a data frame based on logical conditions  | `WHERE`
* `group_by()` = groups a table by a given variable | `GROUP BY`
* `arrange()` = reorders rows of a data frame | `ORDER BY`
* `rename()` = renames variables in a data frame
* `mutate()`
* `summarise()` = like SQL aggregationg (mean, min, max, median, etc)

###Merging Data
* `merge()` = merge two objects (i.e. data frames) | `JOIN`
  * `x` = object to merge
  * `y` = object to merge
  * `by.x =` = key/column to merge ON
  * `by.y =` = key/column to merge ON
  * `all =` = set whether to merge non-existant rows as `NA` rows; `TRUE` or `FALSE`
* `library(plyr)`
  * `join()` = joins two data frames; keys must have the same name
    * `x`
    * `y`
