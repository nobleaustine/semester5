# Create a box plot of the horsepower (hp) in the mtcars dataset. Use
# different shapes to represent the number of gears (gear). Add
# appropriate title, labels, and legend to the plot. Identify and label any
# outliers on the plot

library(ggplot2)
ggplot(mtcars, aes(x = factor(gear), y = hp, shape = factor(gear)))+
  geom_boxplot()+
  labs(title = "horse power",x="horsepower ",y=" frequency")# Load ggplot2
library(ggplot2)

# Create a box plot with shapes for gears
box_plot <- ggplot(mtcars, aes(x = factor(gear), y = hp, shape = factor(gear))) +
  geom_boxplot(outlier.shape = NA) +  # Suppress default outliers
  geom_point(position = position_jitterdodge()) +  # Add jittered points
  scale_shape_manual(values = c(16, 17, 18)) +  # Set shapes for gears
  labs(title = "Box Plot of Horsepower by Number of Gears",
       x = "Number of Gears",
       y = "Horsepower")+
  theme_minimal() +  # Use a minimal theme for clarity
  theme(legend.position = "top") +  # Place legend at the top
  geom_text(aes(label = ifelse(hp > quantile(hp, 0.75) + 1.5 * IQR(hp) | hp < quantile(hp, 0.25) - 1.5 * IQR(hp), rownames(mtcars), "")),
            position = position_jitterdodge(jitter.width = 0.2), vjust = -0.5)

# Display the plot
print(box_plot)