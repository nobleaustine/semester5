# Question 5: Series Summation
# Develop a program to calculate the sum of the series: 1- 2/3 + 3/5- 4/7 + ... up to a
# specified number of terms. Allow the user to input the number of terms in the series

# function to calculate the sum of the series
calculate_series_sum <- function(num_terms) {
  series_sum <- 0
  
  # for loop to calculate each element and add up the elements
  for (i in 1:num_terms) {
    term <- (-1)^(i-1) * i / (2*i - 1)
    series_sum <- series_sum + term
  }
  
  return(series_sum)
}

# Get the number of terms from the user
num_terms <- as.integer(readline(prompt = "Enter the number of terms in the series: "))

# Calculate and display the sum of the series
series_sum_result <- calculate_series_sum(num_terms)
cat("\nSum of the series:", round(series_sum_result, 4), "\n")
