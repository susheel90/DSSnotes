# Week2

##### Coding Standards in R
* Always use text files/text editor
  * Can be read by pretty much any editing program
* Indent your code
  * To visualize the control flow
  * Readability
* Limit the width
  * Readability
* Limit function length
  * Limit to one basic (and descriptive) activity
  * Increase modularity

##### Markdown
* `*italics*`
* `**bold**`
* `#` = h1 heading
* `##` = h2 heading
* `###` = h3 heading
* `####` = h4 heading
* `#####` = h5 heading
* `-` = unordered list
* `1. ...\r\n 2. ...` = ordered list
* `Link.Text(http://link.com)` = link
```
I spend so much time reading [R bloggers][1] and [Simply Statistics][2].
[1]: http://www.r-bloggers.com/ "R bloggers"
[2]: http://simplystatistics.org/ "Simply Statistics"
```

##### R Markdown
* Markdown = designed to help focus on writing; simplified "markup"
  * Complete information is available at http://daringfireball.net/projects/markdown/
  * Background information at http://daringfireball.net/2004/03/dive_into_markdown
* R Markdown allows embeded R code in a Markdown file (`.Rmd` extension)
 * Can be converted into HTML using `knitr` or `slidify`
 * Can be created by any text editor

##### knitr (part 1)
* Literate Statistical Programming = way to document analysis with code for analysis present in that document
  * Article is a stream of text and code
  * Divided into both text and code "chunks"
  * Literate programs are "weaved" to produce human-readable documents
  * Literate programs are "tangled" to produce machine-readable documents
* Sweave = original LSP
* knitr = 
