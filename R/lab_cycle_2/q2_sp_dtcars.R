# Load the mtcars dataset
data(mtcars)

# Create a scatterplot with different colors for cyl
plot(disp ~ mpg, data = mtcars, col = mtcars$cyl, pch = 16,
     xlab = "Miles per Gallon (mpg)",
     ylab = "Displacement (cu.in.)",
     main = "Scatterplot of mpg and disp with Smooth Line")

# Add a smooth line to show the trend
lines(smooth.spline(mtcars$mpg, mtcars$disp), col = "black")

# Add a legend
legend("topright", legend = unique(mtcars$cyl), col = unique(mtcars$cyl), pch = 16, title = "Cylinders")
