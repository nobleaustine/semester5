# Create a scatter plot of the displacement (disp) versus the weight 
# (wt) in the mtcars dataset. Use different colors and sizes to represent 
# the number of carburetors (carb). Add appropriate title, labels, and 
# legend to the plot. Add a smooth line to show the trend of the 
# relationship.

print(factor(mtcars$carb))
plot(mtcars$disp,mtcars$wt,col = factor(mtcars$carb),
     pch = c(1,2,3,4,5,6),
     main=" displacements vs weight",
     xlab=" displacement",
     ylab=" weight")

# Load ggplot2
library(ggplot2)

# Create a scatter plot with colors and sizes for carb
scatter_plot <- ggplot(mtcars, aes(x = disp, y = wt, color = factor(carb)) +
  geom_point(alpha = 0.7) +  # Add points with transparency
  labs(title = "Scatter Plot of Displacement vs. Weight",
       x = "Displacement",
       y = "Weight") +
  scale_color_discrete(name = "Carburetors") +  # Set legend title
  scale_size_discrete(name = "Carburetors") +  # Set legend title
  geom_smooth(method = "lm", se = FALSE) +  # Add a linear regression line
  
  # Display the plot
  print(scatter_plot)
