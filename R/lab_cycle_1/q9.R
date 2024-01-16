# Question 9: Data Compression
# Design a program to read a string and compress it using run-length encoding. In
# run-length encoding, consecutive repeated characters are replaced with a single
# character followed by the count of occurrences.

# function to perform run-length encoding on a string
run_length_encoding <- function(input_str) {
  compressed_str <- ""
  count <- 1
  
  for (i in 1:(nchar(input_str) - 1)) {
    current_char <- substr(input_str, i, i)
    next_char <- substr(input_str, i + 1, i + 1)
    
    if (current_char == next_char) {
      count <- count + 1
    } else {
      compressed_str <- paste0(compressed_str, current_char, count)
      count <- 1
    }
  }
  
  # Include the last character and its count
  compressed_str <- paste0(compressed_str, substr(input_str, nchar(input_str), nchar(input_str)), count)
  
  return(compressed_str)
}

# Get user input for a string
input_string <- readline(prompt = "Enter a string to compress using run-length encoding: ")

# Perform run-length encoding and display the compressed string
compressed_result <- run_length_encoding(input_string)
cat("\nCompressed String:", compressed_result, "\n")
