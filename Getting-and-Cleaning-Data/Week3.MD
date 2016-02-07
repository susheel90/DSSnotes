#Week 3

* [Subsetting and Sorting](https://github.com/SeaSmith1018/DSSnotes/blob/master/Getting-and-Cleaning-Data/Week3.MD#subsetting-and-sorting)
* [Summarizing Data](https://github.com/SeaSmith1018/DSSnotes/blob/master/Getting-and-Cleaning-Data/Week3.MD#summarizing-data)
* [Creating New Variables](https://github.com/SeaSmith1018/DSSnotes/blob/master/Getting-and-Cleaning-Data/Week3.MD#creating-new-variables)

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
* `sum(is.na(data))` = checks for the number of missing values
  * `colSums(is.na(data))` = checks for the number of missing values by column
* `any(is.na(data)) = returns `TRUE` or `FALSE`
* `all(is.na(data)) = returns `TRUE` or `FALSE`
* `table(df$col %in% c(data))` = returns whether or not the condition to the right of `%in%` is present in the specified column of the data frame
  * `df[df$col %in% c(data)]` = returns rows where the predicate is `TRUE`
* `xtab()` =

###Creating New Variables
* Sequences
  * `seq()` = min, max, step, and length
  * `seq(along = variable)` = create index vector with length `length(variable)`
* Binary
  * `ifelse(predicate, <true>, <false>)`
* Categorical
  * `cut()` = breaks a vector (data frame column) into sections (called `breaks`)
    * `c1 <- cut(df$col, breaks = 5)` = will break `df$col` into 5 equal sections (from min to max); will return the break/range that a value falls into
      * `table(c1)` = will return the count for the 5 breaks
* Factor
  * `df$new_col <- factor(df$some_col, levels = c())`
