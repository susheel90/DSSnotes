#Notes

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
