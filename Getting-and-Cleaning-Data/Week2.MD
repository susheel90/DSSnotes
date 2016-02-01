#Week 2

###MySQL
* `library(RMySQL)` = package allows connection to a database
  * `dbConnect()` = connects to a MySQL database
    * `object` = `MySQL()`
    * `user` = the username to login
    * `db` = name of the database to access
    * `host` = the host server name
  * `dbListTables()` = lists the names of the tables in the specified database  
  * `dbListFields()` = lists fields of the specified database and table
  * `dbGetQuery()` = applies a query to a database connection
  * `fetch()` = returns the specified number of results
    * `n =` = number of results to return
  * `dbDisconnect()` = disconnects from the database server
