# Install and load required packages
install.packages("titanic")
install.packages("ggplot2")
install.packages("dplyr")
install.packages("tidyr")

library(titanic)
library(ggplot2)
library(dplyr)
library(tidyr)

# Load the Titanic dataset
data("titanic_train")
titanic_data <- as.data.frame(titanic_train)
print(headd(titanic_data))

# a) Plot the histogram of Number of parents and children of the passenger aboard (parch)
ggplot(titanic_data, aes(x = parch)) +
  geom_histogram(binwidth = 1, fill = "skyblue", color = "black") +
  labs(title = "Histogram of Number of Parents and Children Aboard",
       x = "Number of Parents and Children",
       y = "Frequency") +
  theme_minimal()