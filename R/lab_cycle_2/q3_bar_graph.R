
library(ggplot2)
# Create a bar plot of the number of cylinders (cyl) in the mtcars 
# dataset. Use different colors to represent the transmission type (am). 
# Add appropriate title, labels, and legend to the plot
  
# Create a stacked bar graph with different colors for automatic (0) and manual (1)
ggplot(mtcars, aes(x = factor(cyl), fill = factor(am))) +
geom_bar(position = "stack", stat = ) +
labs(title = "Number of Cylinders by Transmission Type",
         x = "Number of Cylinders",
         y = "Count") +
  scale_fill_manual(values = c("red", "blue"), name = "Transmission Type")
