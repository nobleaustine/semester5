# gettting the summary
data("iris")
head(iris)
summary(iris)
dim(iris)

# histogram
hist(iris$Sepal.Length, main="Histogram of Sepal Length",
     xlab="Sepal Length",
     col="lightblue",
     border="black")

# boxplot
boxplot(Sepal.Length ~ Species,
        data<-iris,
        main<-"Boxplot of Sepal Length by Species",
        xlab<-"Species", ylab<-"Sepal Length",
        col<-c("lightblue", "lightgreen", "lightcoral")
)

# anova test
result_anova <- aov(Sepal.Length ~ Species, data<-iris)
summary(result_anova)

pairs(iris[, 1:4],
      col =iris$Species,
      pch = 19,
      cex = 1.5,
      main= "Pair Plot of Iris Dataset")