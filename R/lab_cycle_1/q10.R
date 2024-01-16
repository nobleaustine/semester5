# Question 10: Data Reversal
# Write a program to reverse the order of elements in a given list. Implement this without
# using any built-in functions or loops.

# Function to reverse a list without using built-in functions or loops
reverse_list <- function(input_list) {
  if (length(input_list) <= 1) {
    return(input_list)
  } else {
    return(c(tail(input_list, 1), reverse_list(head(input_list, -1))))
  }
}

# Get user input for a list
user_list <- as.numeric(strsplit(user_input, " ")[[1]])

# Display the original and reversed lists
cat("\nOriginal List:", user_list, "\n")
reversed_list <- reverse_list(user_list)
cat("Reversed List:", reversed_list, "\n")


