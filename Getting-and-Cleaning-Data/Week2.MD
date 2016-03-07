#Week 2

###Reading from MySQL
* `library(RMySQL)` = package allows connection to a database
  * `dbConnect()` = connects to a MySQL database
    * `object` = `MySQL()`
    * `user` = the username to login
    * `db` = name of the database to access
    * `host` = the host server name
  * `dbListTables()` = lists the names of the tables in the specified database  
  * `dbListFields()` = lists fields of the specified database and table
  * `dbReadTable()`
  * `dbGetQuery()` = applies a query to a database connection
    * `dbSendQuery()` = sends query to database (for when amount of data is too big to be held in memory)
    * `fetch()` = returns the specified number of results
      * `n =` = number of results to return
    * `dbClearResult()` = clear the query from the server
  * `dbDisconnect()` = disconnects from the database server

###Reading from HDF5
* Used for storing large data sets
* Supports storing a range of data types
* Heirarchical data format
  * Groups = contain data sets and metadata
    * Cotains a header with group name and list of attributes
    * Contains a group symbol table with a list of objects in group
  * Datasets = multidimensional array of data elements with metadata
* `source("http://bioconductor.org/biocLite.R"); biocLite("rhdf5"); library(rhdf5)`
* `h5createFile()` = creates an hdf5 file (extension `.h5`)
* `h5write()` = writes an object (array) to a file
  * `object` = the object to write to the file
  * `file` = the name of the file to be written
  * `name` = name of the dataset in the hdf5 file
* `h5read()` = reads an object from an hdf5 file
  * `h5readAttributes()` = reads attributes
* `h5ls()` = like `ls()` for hdf5 objects

###Reading from the Web
* `url()` = opens connection to specified url
* `readLines()` = reads lines of data from connection
* `close()` = closes a url connection
* `library(XML)`
  * `htmlTreeParse()` = reads data from HTML file
* `library(httr)`
  * `GET()` = connects to specified url
    * `authenticate)` = passes a username and password to a url connection
  * `content()` = retrieves specified data from the given url connection
  * `htmlParse()` = parse html text

###Reading From APIs
* Must have an account with the website (a key to the API)
* `library(httr)`
  * `oauth_app()` = starts the authorization process for an API
    * `name` = name of application (for convenience)
    * `key` = username
    * `secret` = password
  * `sign_oauth1.0()` =
    * `token`
    * `token_secret`
  * `GET()` = use the API url and sign-in authorization (`sign_oauth1.0()`)
  * `POST()`
  * `PUT()`
  * `DELETE()`
* `library(jsonlite)`
  * `content()`
  * `jsonlite::fromJSON()`
* httr/demo/oauth2-github.r
* [OAuth Workflow](https://sites.google.com/site/vishyranganath/home/announcements/firstpost/OAuth%20Process.jpg)

###Reading From Other Sources
* There is a package for everything
* Interacting with files
  * `file()`
  * `url()`
  * `gzfile()`
  * `bzfile()`
* Foreign package = reads data from Minitab, S, SAS, SPSS< Stata, Systat
  * `read.arff()`
* Database packages
  * `library(RPostresSQL)` = DBI compliant database connection package
  * `library(RSQLServer)`
