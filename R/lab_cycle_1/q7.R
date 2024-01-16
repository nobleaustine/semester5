# Question 7: Fibonacci Series with a Twist
# Develop a program to generate the Fibonacci series, but with a twist. Allow the user to
# input the number of terms and generate the series where each term is the sum of the
# last three terms


# Function to generate a modified Fibonacci series
generate_modified_fibonacci <- function(num_terms) {
  if (num_terms == 1) {
    return(c(0))
  } else if (num_terms == 2) {
    return(c(0, 1))
  } else {
    series <- c(0, 1, 1)
    for (i in 4:num_terms) {
      next_term <- series[i-1] + series[i-2] + series[i-3]
      series <- c(series, next_term)
    }
    return(series)
  }
}

# Get the number of terms from the user
num_terms <- as.integer(readline(prompt = "Enter the number of terms in the modified Fibonacci series: "))

# Generate and display the modified Fibonacci series
modified_fibonacci_result <- generate_modified_fibonacci(num_terms)
cat("\nModified Fibonacci Series:", modified_fibonacci_result, "\n")

