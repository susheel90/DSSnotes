## Ranking Hospitals

rankhospital <- function(state, outcome, num = "best"){
    best(state, outcome)
    ordered_table <- ordered_outcome[order(ordered_outcome[2]), ]
        num_list = c("best" = "best", "worst" = "worst")
        match_num_list <- match(num, num_list, incomparables = TRUE)
        if(!is.na(match_num_list) & match_num_list == 1){
            number <- as.numeric(1)
        }   else if(!is.na(match_num_list) & match_num_list == 2){
            number <- nrow(ordered_table)
        }   else if(is.na(match_num_list)){
            number <- as.numeric(num)
        }
    grab_num <- ordered_table[number, 1]
    return(grab_num)
}