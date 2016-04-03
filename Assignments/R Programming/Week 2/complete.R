complete <- function(directory = "specdata", id = 1:332) {
    

    flist <- dir(directory, full.names = TRUE)      ## list all files
    tlist <- lapply(flist,read.csv)                 ## read all files
        tlist2 <- lapply(tlist, complete.cases)     ## cobs for all files
            tlist3 <- lapply(tlist2, sum)           ## number of cobs
                tlist4 <- tlist3[id]                ## return specific id's
    
    cobs <- data.frame(
                        matrix(
                        unlist(tlist4), nrow = length(id), byrow = TRUE),
            stringsAsFactors = FALSE)
    
    cobs <- cbind.data.frame("id" = id, "nobs" = cobs)      ## combine everything
    colnames(cobs) <- c("id", "nobs")
    return(cobs)                                        ## print
}