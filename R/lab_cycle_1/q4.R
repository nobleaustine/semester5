# Question 4: Password Generator
# Write a program to generate a random password for a user. The password should
# include a mix of uppercase letters, lowercase letters, digits, and special characters.
# Allow the user to specify the length of the password.

# function to generate a random password
generate_password <- function(length) {
  # setting up a list of all character sets
  uppercase_letters <- LETTERS
  lowercase_letters <- letters
  digits <- 0:9
  special_characters <- c('!', '@', '#', '$', '%', '^', '&', '*')
  
  # Combining all character sets
  all_characters <- c(uppercase_letters, lowercase_letters, digits, special_characters)
  
  # Generate random password by sampling from this set of all characters
  password <- paste0(sample(all_characters, length, replace = TRUE), collapse = '')
  
  return(password)
}

# Get password length from the user
password_length <- as.integer(readline(prompt = "Enter the desired password length: "))

# Check if the entered value is a positive integer
if (!is.numeric(password_length) || password_length <= 0 || password_length != round(password_length)) {
  cat("Invalid input. Please enter a positive integer for password length.\n")
} else {
  # Generate and display the password
  password_result <- generate_password(password_length)
  cat("\nGenerated Password: ", password_result, "\n")
}
