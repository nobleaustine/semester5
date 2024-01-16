# Create a histogram of the miles per gallon (mpg) in the mtcars 
# dataset. Use different shades of blue to represent the frequency of 
# each bin. Add appropriate title and labels to the plot. Calculate and 
# display the mean and standard deviation of mpg on the plot

# Load ggplot2
library(ggplot2)

# Create a histogram with shades of blue
hist_plot <- ggplot(mtcars, aes(x = mpg, fill = ..count..)) +
  geom_histogram(binwidth = 3, color = "white", alpha = 0.7) +
  scale_fill_gradient(low = "lightblue", high = "darkblue") +
  
  # Add title and labels
  labs(title = "Histogram of Miles Per Gallon (mpg)",
       x = "Miles Per Gallon",
       y = "Frequency") +
  
  # Calculate and display mean and standard deviation
  annotate("text", x = 30, y = 6, 
           label = paste("Mean: ", round(mean(mtcars$mpg), 2), "\n", "SD: ", round(sd(mtcars$mpg), 2)),
           size = 3, color = "black")

# Display the plot
print(hist_plot)