## run_analysis.R

# 0-a Load packages
#----------------------------------------------------------------------------------------
library(magrittr)   # %>%
library(dplyr)      # bind_cols(), bind_rows(), left_join()
library(stringr)    # str_to_title() 
#----------------------------------------------------------------------------------------


# 0-b. Download, unzip, and read the data
#----------------------------------------------------------------------------------------
    url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(url, "dataset.zip")
        newwd <- paste(getwd(), "dataset", sep = "/")
        unzip("dataset.zip", exdir = newwd)
        files <- list.files(newwd, recursive = TRUE, full.names = TRUE)
        raw_files <- files[c((1:2), (14:16), (26:28))] %>%
                        lapply(function(x) read.delim(
                                                      x,
                                                      header = F,
                                                      sep = " "
                                                      )
                               )
                
        x_files <- lapply(raw_files[c(4,7)], function(x) apply(
                                                               x,
                                                               1,
                                                               function(y) y[!is.na(y)]
                                                               )
                          )    %>%
                   lapply(function(x) data.frame(
                                                 matrix(
                                                        unlist(x),
                                                        byrow = T,
                                                        ncol = 561
                                                        ),
                                                 stringsAsFactors = F
                                                 )
                          ) 
#----------------------------------------------------------------------------------------

                
# 1. Merge files and union the `test` and `training` datasets
#----------------------------------------------------------------------------------------
    colnames(raw_files[[5]]) <- "V2"
    colnames(raw_files[[8]]) <- "V2"
        test <- bind_cols(raw_files[[3]], raw_files[[5]], x_files[[1]])
        training <- bind_cols(raw_files[[6]], raw_files[[8]], x_files[[2]])
    all_trials <- bind_rows(test, training)
#----------------------------------------------------------------------------------------
   
    
# 2. Extract only the mean and standard deviation measurements    
#----------------------------------------------------------------------------------------
    features <- raw_files[2]
    col_vec1 <- c("mean()", "std()") %>%
        paste(collapse = "|") %>%
        grep(features[[1]]$V2)
            col_vec2 <- col_vec1 + 2
            col_vec2 <- c(c(1,2), col_vec2)
    all_trials <- all_trials[ ,col_vec2]
#----------------------------------------------------------------------------------------

    
# 3. Give descriptive activity names
#----------------------------------------------------------------------------------------
    activities <- raw_files[1]
        activities[[1]]$V2 <- gsub("_", " ", activities[[1]]$V2) %>%
                            str_to_title()
    analysis_table <- left_join(x = all_trials, y = activities[[1]], by = c("V2" = "V1")) %>%
                        select(1,-2,82,3:81)
#----------------------------------------------------------------------------------------
  
    
# 4. Give descriptive variable names 
#----------------------------------------------------------------------------------------        
    features <- features[[1]]
        features <- features[col_vec1, ]
            cnames <- c("Subject", "Activity", as.character(features$V2))
    colnames(analysis_table) <- cnames
    write.table(analysis_table, "analysis_table.txt", row.names = TRUE)
#----------------------------------------------------------------------------------------
    
    
# 5. GROUP BY average(*), activity -- and -- GROUP BY average(*), subject
#----------------------------------------------------------------------------------------
    summary_table <- aggregate(analysis_table[-(1:2)], by = list(analysis_table$Subject, analysis_table$Activity), FUN = mean)
    write.table(summary_table, "summary_table.txt", row.names = TRUE)
#----------------------------------------------------------------------------------------        
    
