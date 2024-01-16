# Question 2: String Encryption
# Write a program that reads a sentence from the user and encrypts it using a simple
# Caesar cipher. The user can specify the shift value. Implement the encryption such that
# only alphabetic characters are shifted, while maintaining their case.


# function to get a string and shift value
# and encrpt and display the content
encrypt_display <- function(){

  # new sentence for storing encryption
  new_sentence <- ""
  # Getting all lowercase and uppercase alphabets 
  a <- letters
  A <- LETTERS
  
  
  # loop to go through all letters in the sentence 
  for (i in 1:nchar(sentence)){
    # loop to go through all alphabets 
    for (j in 1 : 26){
      # getting the letter and checking with all alphabets   
      value <- substring(sentence,i,i)
      # for small letters
      if(a[j] == value){
        # logic to rotate if the shifting go out of 26 
        if(j>26-n){ new_sentence <-paste0(new_sentence,a[j-(26-n)])
        print(j-(26-n)) }
        else{ new_sentence <-paste0(new_sentence,a[j+n])  }
      }
      # for capital letters
      if(A[j] == value){
        # logic to rotate if the shifting go out of 26
        if(j>26-n){ new_sentence <-paste0(new_sentence,A[j-(26-n)]) }
        else{ new_sentence <-paste0(new_sentence,A[j+n])  }
      }
      
    }
    
    
    # keeping all non alphabets as it is
    if (value %in% a == FALSE & value %in% A == FALSE){ new_sentence <-paste0(new_sentence,value)}
    
  }
  cat("Actualsentence : ",sentence)
  print(" ")
  cat("Encrypted sentence : ",new_sentence)
  
}

# taking the sentence and shift value as user inputs
sentence <- readline("Enter the sentence to be encrypted : ")
n<-readline("Enter the shift value : ")
n <- as.numeric(n)
# converting shift value to 1-26 if n>26
if(n > 26){
  n <- n%%26
}

encrypt_display(sentence,n)