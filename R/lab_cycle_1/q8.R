# Question 8: Palindrome Checker
# Write a program that reads a string and checks if it's a palindrome. A palindrome is a
#  string that reads the same forwards and backwards, ignoring spaces and punctuation

# Function to check if a string is a palindrome
palindrome_checker <- function(str) {
  # Remove spaces and punctuation, convert to lowercase
  cleaned_str <- tolower(gsub("[[:space:][:punct:]]", "", str))
  reversed_str <- rev(strsplit(cleaned_str, NULL)[[1]])
  joined_str <- paste(reversed_str, collapse = "")
  
  return(cleaned_str == joined_str)
}

# Get user input for a string
input_string <- readline(prompt = "Enter a string to check for palindrome: ")

# Check if the entered string is a palindrome
if (palindrome_checker(input_string)) {
  cat("\nThe entered string is a palindrome.\n")
} else {
  cat("\nThe entered string is not a palindrome.\n")
}
