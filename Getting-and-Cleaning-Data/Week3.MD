#Week 3

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
* `sum(is.na(data)) = checks for the number of missing values
  * `colSums(is.na(data)) = checks for the number of missing values by column
* `any(is.na(data)) = returns `TRUE` or `FALSE`
* `all(is.na(data)) = returns `TRUE` or `FALSE`
* `table(df$col %in% c(data))` = returns whether or not the condition to the right of `%in%` is present in the specified column of the data frame
