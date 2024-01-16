# Question 1: Data Types and Manipulation
# Develop a program to read a paragraph of text and perform the following tasks:


# a. Count the total number of words.
# reading a txt file where each line will an element of character vector returned
paragraph <- readLines("C:\\NOBLEAUSTINE\\GitWorld\\semester5\\R\\lab_cycle_1\\quote.txt")

print("Paragraph : ")
print(paragraph)

para <- paste(paragraph, collapse = ' ') # concatenate into a single string
words <- strsplit(para," ")              # splitting the paragraphs by ' '
no_of_words <- lengths(words);           # length of list
cat('Total number of words : ', no_of_words)

# b. Calculate the average word length.
words <- unlist(words)                    # unlisting to single array
total <- sum(nchar(words))                # sum of length of words
avg_word_len <- total/no_of_words         # total sum / no. of words
cat("Average word length : ",avg_word_len)

# c. Identify and print the longest word.
max_len = max(nchar(words))
for (word in words){
  if (nchar(word) == max_len){
    cat("longest word : ",word)
  }
}


# d. Replace all occurrences of a specific word with another word of your choice.
old_word <- readline("Enter the word to be replaced : ")
new_word <- readline("Enter the replacement word    : ")
paragraph <- gsub(old_word, new_word, paragraph)
print(paragraph)
