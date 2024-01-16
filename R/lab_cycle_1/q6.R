# Question 6: Prime Number Checker
# Write a program to check whether a given number is prime or not. Implement this using
# both loops and functions. Additionally, allow the user to input a range and identify all
# prime numbers within that range.

# Function to check if a number is prime
is_prime <- function(n) {
  if (n <= 1) {
    return(FALSE)
  }
  for (i in 2:sqrt(n)) {
    if (n %% i == 0) {
      return(FALSE)
    }
  }
  return(TRUE)
}

# Function to find prime numbers in a given range
find_primes_in_range <- function(start, end) {
  primes_in_range <- c()
  for (num in start:end) {
    if (is_prime(num)) {
      primes_in_range <- c(primes_in_range, num)
    }
  }
  return(primes_in_range)
}

# Get user input for a single number
number <- as.integer(readline(prompt = "Enter a number to check for primality: "))

# Check and display whether the number is prime
if (is_prime(number)) {
  cat(number, "is a prime number.\n")
} else {
  cat(number, "is not a prime number.\n")
}
  
# Get user input for a range
start_range <- as.integer(readline(prompt = "Enter the start of the range: "))
end_range <- as.integer(readline(prompt = "Enter the end of the range: "))


# Find and display prime numbers in the given range
primes_in_range <- find_primes_in_range(start_range, end_range)
if (length(primes_in_range) > 0) {
  cat("\nPrime numbers in the range", start_range, "to", end_range, "are:", primes_in_range, "\n")
} else {
  cat("\nNo prime numbers found in the specified range.\n")
}
  

