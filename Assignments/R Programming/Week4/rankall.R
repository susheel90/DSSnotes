## Nationally rank top performing hospitals of each state

rankall <- function(outcome, num = "best"){
    all_states <- lapply(state.abb, function(x) rankhospital(x, outcome, num))
    names(all_states) <- state.abb
    states_table <- data.frame("hospital" = matrix(unlist(all_states), byrow = TRUE), stringsAsFactors = FALSE)
    states_table <- cbind("state" = c(names(all_states)), states_table)
    return(states_table)
}