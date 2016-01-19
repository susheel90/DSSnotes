corr <- function(directory = "specdata", threshold = 0) {
        
cnobs <- complete()                                 ## call complete()
    thresh <- cnobs[cnobs$nobs > threshold, ]       ## filter on threshold
        f1 <- dir(path = directory, full.names = T) ## list directory files    
        f2 <- f1[thresh[[1]]]                       ## create index files
            t1 <- lapply(f2,read.csv)               ## read index files
corr_result <- sapply(t1, function(x) cor(x[2], x[3], use = "complete.obs"))       
return(corr_result)
}
