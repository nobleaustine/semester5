paragraph <- readline("Enter a paragraph: ");

#length of the paragaraph

noOfWrds <- lengths(strsplit(paragraph," "));
paste ("Number of words: ", noOfWrds)
