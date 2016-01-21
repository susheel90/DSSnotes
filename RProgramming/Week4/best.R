## Hospital Data
best <- function(state = character(), outcome = character()){


## Check state input
state_list <- state.abb
state_truth <- sapply(state_list, function(x) x == state)
if(sum(state_truth) == 0) stop("invalid state")

## Check outcome input
outcome_list <- c("heart attack", "heart failure", "pneumonia")
outcome_truth <- sapply(outcome_list, function(x) x == outcome)
if(sum(outcome_truth) == 0) stop("invalide outcome")

## Read file
outcome_file <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
}