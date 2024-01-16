# Question 3: Data Validation and User Input
# Develop a program to read student records with their names, ages, and grades.
# Implement validation checks:

# a. Ensure age is a positive integer.

# function to check if age is a positive integer
# by checking if it satisfy the regular expression 
# for positive integers
age_validator <- function(age) {grepl("^\\d+$", age)}

# b. Ensure grade is a valid letter grade (A, B, C, D, F)

# function to checking if grade lies in 
# the list (A, B, C, D, F)
grade_validator <- function(grade) {
  valid_grades <- c('A', 'B', 'C', 'D', 'F')
  if (grade %in% valid_grades) {
    return(TRUE)
  } else {
    return(FALSE)
  }
}

# c. Calculate and display the average age of students with valid records.

#function to read student records 
read_student_records <- function() {
  records <- data.frame(name = character(0), age = numeric(0), grade = character(0))
  c = 1
  while (c == 1) {
    name <- readline(prompt = "Enter student name: ")
    age <- as.numeric(readline(prompt = "Enter student age: "))
    grade <- toupper(readline(prompt = "Enter student grade (A, B, C, D, F): "))
    print(" ")
    

    # checking if age and grade are valid   
    if (age_validator(age) && grade_validator(grade)) {
      records <- rbind(records, data.frame(name = name, age = age, grade = grade))
    }else {
      cat("Invalid Age or Grade please enter valid information.\n")
      print(" ")
      
      }
    
    c <- as.numeric(readline(prompt = "Enter 1 to continue and 0 to exit: "))
    print(" ")
  }
  
  return(records)
}

# calculate and display average students age
avg_age_display <- function(records){
  
  if (nrow(records) > 0) {
    cat("\nStudent Records:\n")
    print(records)
    
    # Calculate and display average age
    avg_age <- mean(records$age)
    cat("\nAverage Age of Students: ", round(avg_age, 2), "\n")
  } else {
    cat("\nNo valid student records entered.\n")
  }
  
}

# calling functions to take in record
# and display average student age
R <- read_student_records()
avg_age_display(R)
