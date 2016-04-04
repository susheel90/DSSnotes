## Getting the best hospital per outcome

best <- function(state = character(), outcome = character()){


## Check state input
state_list <- state.abb
state_truth <- match(state, state_list)
if(is.na(sum(state_truth))) stop("invalid state")

## Check outcome input
outcome_list <- list("11" = "heart attack", "17" = "heart failure", "23" = "pneumonia")
outcome_truth <- match(outcome, outcome_list)
if(is.na(sum(outcome_truth))) stop("invalid outcome")

## Read file and tunnel down to state
read_file <<- read.csv("outcome-of-care-measures.csv", na.strings = "Not Available", stringsAsFactors = FALSE)
        outcome_col <<- as.numeric(names(outcome_list[outcome_truth]))
column_file <- read_file[which(read_file[[7]] == state), c(2, outcome_col)] ## filter rows by $State == state
complete_outcome <- column_file[complete.cases(column_file),]               ## only complete cases
ordered_outcome <<- complete_outcome[order(complete_outcome[[1]]), ]        ## order alphabetically on $Hospital.Name
return_set <- complete_outcome[which.min(complete_outcome[[2]]), ]
return(return_set)


}

#[2] "Hospital.Name"
#[7] "State"
#[11] "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"
#[17] "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"
#[23] "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"