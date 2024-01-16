# loading iris dataset
data(iris)

# plotting scatterplot of sepal and petal length
plot(iris$Sepal.Length,iris$Petal.Length,
     xlab="Petal Length",
     ylab="Sepal Length",
     main="Scatter Plot Sepal vs Petal length",col="blue")

# saving the plot as PNG file
PNG("sepal_petal",height=600,width=600,units="px")
plot(iris$Sepal.Length,iris$Petal.Length,
     xlab="Petal Length",
     ylab="Sepal Length",
     main="Scatter Plot Sepal vs Petal length",col="blue")
dev.off()