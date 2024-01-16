
#reading csv file
data <- read.csv("C:\\NOBLEAUSTINE\\RLAB\\labcycle2\\time-series-19-covid-combined.csv")

print(head(data))

# Load required libraries
library(ggplot2)


curves_plot <- ggplot(data, aes(x = Date)) +
  geom_line(aes(y = Confirmed), color = "blue", linewidth = 2) +
  geom_line(aes(y = Recovered), color = "red", linewidth = 2) +
  geom_line(aes(y = Deaths), color = "green", linewidth = 2) +
  labs(title = "Multiple Curves Plot", x = "X-axis Label", y = "Y-axis Label") +
  theme_minimal()
print(curves_plot)
