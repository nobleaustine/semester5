

  data <- read.csv("TITANIC.csv")
  summary(data)



  #png(file <-"titanicpatch.png")
  hist(data$Par, main <- "Histogram of Number of Parents/Children Aboard",
       xlab <- "Number of Parents/Children",
       ylab <- "Frequency"
  )
  
  table(data$Pclass, data$Survived)
  table(data$Sex, data$Survived)
  chisq.test(data$Pclass, data$Survived)
  chisq.test(data$Sex, data$Survived)
  
  boxplot(Age ~ Survived, data<-data,
          main<-"Age Distribution of Survivors and Non-Survivors",
          xlab<-"Survived", ylab<-"Age",
          col<-c("lightblue", "lightgreen")
  )
