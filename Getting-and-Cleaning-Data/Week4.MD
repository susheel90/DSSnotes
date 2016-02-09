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
* Variable morality:
  * Character variables should be converted to factors
  * All lower case when possible
  * Descriptive (Male/Female vs 0/1 or M/F)
  * Not duplicated
  * No underscores, dots, or white spaces

###Regular Expressions I
* Literal = matches exactly
* `^` = start of a line
* `$` = end of a line
* `[<upper><lower>]` = will match both upper and lower case letters
* `[<range>]` = will match to given range

###Regular Expressions II
* `.` = any single character
* `|` = combines multiple possible expressions
* `?` = optional
* `\` = escape character for literals
* `*` = repeat any number of times including none
* `+` = repeat at least one
