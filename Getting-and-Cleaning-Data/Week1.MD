#Week1

* [Components of Tidy Data](https://github.com/SeaSmith1018/DSSnotes/blob/master/Getting-and-Cleaning-Data/Week1.MD#components-of-tidy-data)
* [Downloading Files](https://github.com/SeaSmith1018/DSSnotes/blob/master/Getting-and-Cleaning-Data/Week1.MD#downloading-files)
* [Reading Local Files](https://github.com/SeaSmith1018/DSSnotes/blob/master/Getting-and-Cleaning-Data/Week1.MD#reading-local-files)
* [Reading Excel Files](https://github.com/SeaSmith1018/DSSnotes/blob/master/Getting-and-Cleaning-Data/Week1.MD#reading-excel-files)
* [Reading XML](https://github.com/SeaSmith1018/DSSnotes/blob/master/Getting-and-Cleaning-Data/Week1.MD#reading-xml)
* [Reading JSON](https://github.com/SeaSmith1018/DSSnotes/blob/master/Getting-and-Cleaning-Data/Week1.MD#reading-json)
* [The data.table Package](https://github.com/SeaSmith1018/DSSnotes/blob/master/Getting-and-Cleaning-Data/Week1.MD#the-datatable-package)  

###Components of Tidy Data
* Raw data - the file from which data is taken; the original format
  * No software or processing associated with data
  * No manipulation
  * No summarization
* Tidy data - processed data that is ready for analysis
  * One variable per column (readable variables)
  * Unqiue rows
  * One table for every kind of data (one file per table)
  * Multiple tables should have foreign keys
* Code book - meta data; explains variables and what the data are trying to say
  * Information about variables (units, etc)
  * Information about summary choices (was mean and median taken in addition to total?)
  * Experimental study design
  * Markdown file format
* Recipe - exact and explicit detailing of steps taken to go from one data format (raw) to the next (tidy)
  * A computer script
  * Input is the raw data
  * Outpus is processed data (tidy data)
  * No parameters to the script (everything is fixed and ready-to-go)
  * Explicitly state steps that cannot be script

###Downloading Files
* Download through R to include in scripts that you can share
* Record the date when you download a fiel (in case it changes at a later date)
* `download.file()` = download file from the internet (especially text)
  * `url` = website
  * `destfile` = where to download on computer (and what file format i.e. .csv, .txt, .las, etc)
  * `method` = secured? (https)

###Reading Local Files
* `read.table()` = read data into R
  * `quote` = sets the characters that represent a quote
  * `na.strings` = sets the character that represents missing values (i.e. "Missing Value")
  * `nrows` = how many rows to read
  * `skip` = number of lines to skip

###Reading Excel Files
* Use `library(openxlsx)` and `library(readxl)`, which have no Java dependency
* `library(xlsx)`
  * `read.xlsx()`
    * `dest` = file path
    * `sheetIndex` = which worksheet (based on ordinal position)
    * `header` = is there a header? (`TRUE` or `FALSE`)
  * `read.xlsx2()` = faster than `read.xlsx()` but unstable for reading subsets of rows
* `library(XLConnect)` = for a lot of processing

###Reading XML
* Tags = labels defining the category or type
  * `<start></end>`
  * `<empty />`
* Element = what is inside the tag
  * `<tag>this is the element</tag>`
* Attribute = components of the tag/label
  * `<tag an-attribute = "2">`
* `library(XML)` = reads XML files
* `xmlRoot()` = retrieves the wrapper (outer most tage) of the xml file
  * `rootNode <- xmlRoot(doc)` = retrieves the root nodes
  * `rootNode[[1]]` = returns the first element
  * `rootNode[[1]][[1]]` = extracts the first subnode of the first root node
* XPath - HTML stuff; see: http//www.stat.berkley.edu/~statcur/Workshop2/Presentations/XML.pdf
  * `/node` = top level node
  * `//node` = node at any level
  * `node[@attr-name]` = node with an attribute name
  * ` node[@attr-name='bob']` = node with an attribute name attr-name='bob'
  * `xpathSApply()`
    * `rootNode` = the root node
    * `//node` = the name of the node
    * `xmlValue` = the XML value (elements)
    * Nodes = list of nodes you may use:
      * `li` = list element
      * `td` = table element
      * `a` = link
      * `title` = title
```
fileUrl("http://espn.go.com/nfl/team/_/name/bal/baltimore-ravens"
doc <- htmlTreeParse(fileUrl, useInternal = TRUE)
scores <- xpathSApply(doc, "//li[@class='score']", xmlValue)
teams <- xpathSApply(doc, "//li[@class='team-name']", xmlValue)
scores
teams
```

###Reading JSON
* Javascript Object Notation
* Similar to XML
* Common API data format
  * Numbers
  * Strings (doube quotes "")
  * Boolean (true or false)
  * Array (in brackets [])
  * Object (in curly brackets {})
* `library(jsonlite)`
  * `readJSON()`
* http://www.json.org/
* http://www.r-bloggers.com/new-package-jsonlite-a-smarter-json-encoderdecoder/

###The data.table Package
* Inherets from `data.frame()`
  * Pass same arguments for `data.table()` as you would `data.frame()`
* `tables()`
  * `NAME`, `NROW`, `MB`, `COLS`, `KEY`
* Can use expressions on rows and columns (i.e. `dt[,list(mean(x), sum(z))]`)
* Easily add new columns (i.e. `dt[,w := z^2]`)
* Special variables and functions
  * `.N` = count; an integer, length 1, containing the count
  * `setkey()` = sets the key for the table
    * Subsetting `setkey(dt, x); dt['a]` will return values in the column `x` which are equal to `a`
    * Merging `setkey(dt1, x); setkey(dt2, x); merge(dt1, dt2)` will merge (join) the two tables on the key
