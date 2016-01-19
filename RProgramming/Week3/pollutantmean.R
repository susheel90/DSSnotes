pollutantmean <- function(directory, pollutant , id = 1:332) {

    
## create data frame to hold all id.csv files
master_data <- data.frame()


    ##
    ## loop through each id
    for (j in 1:length(id)){
        
    
        k <- as.numeric(id[j])
        
        ## append necessary starting characters
        if (k < 10) {
            ## append 00
            k <- as.character(k)
            k <- paste("00", k, sep = "")
        
            } else if (k >= 10 && k < 100) {
            ## append 0
            k <- as.character(k)
            k <- paste("0", k, sep = "")
        
            } else {
            ## append nothing
            k <- as.character(k)
        }
    
    ## create file path, data frame, and then append it to the master
    file_path <- paste(getwd(), "/", directory, "/", k, ".csv", sep = "")
    file_table <- read.csv(file_path)
    master_data <- rbind.data.frame(master_data, file_table)
    
    
    ## This is the end of the loop ##
    ##
    }
    

## find the average of the specified pollutant and print
all_mean <- colMeans(master_data[pollutant], na.rm = TRUE)
print(all_mean)


}
