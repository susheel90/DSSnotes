pollutantmean <- function(directory = "specdata",
                          pollutant = "sulfate", 
                          id = 1:332) {
    
i <- length(id)                                     ## iteration length
Pollutant_Mean <- 0     
    for(j in 1:i)                                   ## From 1 to i
    {     
        ## set the new working directory
        old_dir <- getwd()
        new_dir <- paste(old_dir, directory, sep = "/")
        setwd(new_dir)
       
        ## set file name
        k <- id[j]                                  ## grab element value
        fname <- paste(k,".csv", sep = "")          ## create the file name
        
        ## read the csv file
        data_k <- read.csv(fname)                   ## read all data to data_k
            
            if (pollutant == "sulfate")             ## see which column to use
            {
                colnum <- 2                         
            } else { 
                     colnum <- 3
                   }                         
                                                    ## if neither, abort
            
            
        Pollutant_Mean_k <- colMeans(data_k[colnum], na.rm = TRUE)         ## average
        Pollutant_Mean <- Pollutant_Mean + Pollutant_Mean_k    ## tally
            rm(old_dir)                             ## clean it up
            rm(new_dir)                             ## clean it up
            rm(data_k)                              ## clean it up
            rm(fname)                               ## clean it up
    }
Returned_Pollutant_Mean <- mean(Pollutant_Mean)     ## average all tallies
print(Returned_Pollutant_Mean)
## rm(Pollutant_Mean)                              ## clean it up
}