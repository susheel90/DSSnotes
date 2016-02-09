#Week 4

###Editing Text Variables
*Substringing
  * `strsplit()` = splits (parses) a word by a given character 
    * Subset splits by calling the element of an element (i.e. `df[[5]][2]`)
    * `strsplit(names(df), "\\.")` = returns character strings split by a `.`
    * `firstElement <- function(x){x[1]};  sapply(df, firstElements` = returns the first element of each split string in a list
  * `sub()` = will replace (sub) one character pattern with another; case specific
  * `sbstr()` = will return the substring as specified by the start and end positions
  * `paste()` = combines strings with a space in between (but can be modified)
  * `library(stringr)` = library of useful string related functions
    * `str_trim()` = removes trailing and leading spaces
* Regular Expressions
  * `grep()` = returns the ordinal positions of all the matches
    * `value = TRUE` = returns the whole substrings of all the matches (what it is that matched with the pattern)
    * `fixed TRUE=` = the match must be exact
  * `grepl()` = returns the logical vector of all the matches
    * `table(grepl("pattern", df$col))` = returns the logical total of matches as `TRUE` and non-matches as `FALSE`
* Character variables should be converted to factors
