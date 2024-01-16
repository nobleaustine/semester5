# Load necessary libraries
install.packages("forecast")
library(readr)
library(dplyr)
library(ggplot2)
library(forecast)

# Load the data
data <- read.csv("/content/time-series-19-covid-combined.csv")

# Filter data for India and the specified date range
data <- data %>%
  filter(Country/Region == "India" & Date >= as.Date("2020-01-22") & Date <= as.Date("2020-12-15"))

# 1. Univariate Time Series Analysis
# Create a time series object for the total positive COVID-19 cases
cases_ts <- ts(data$Confirmed, start=c(2020, 22), frequency=7)

# Visualize the time series data using a line chart
ggplot(data, aes(x=Date, y=Confirmed)) +
  geom_line() +
  labs(x="Date", y="Total Positive Cases", title="COVID-19 Cases in India")

# 2. Multivariate Time Series Analysis
# Create a multivariate time series object that includes both the total positive cases and total deaths
multi_ts <- ts(cbind(data$Confirmed, data$Deaths), start=c(2020, 22), frequency=7)

# Plot both series on a single chart
autoplot(multi_ts) +
  labs(x="Date", y="Count", title="COVID-19 Cases and Deaths in India") +
  guides(colour=guide_legend(title="Series")) +
  scale_colour_manual(values=c("blue", "red"), labels=c("Confirmed", "Deaths"))

# 3. Time Series Forecasting
# Use the auto.arima() function from the forecast library to fit an ARIMA model to the total positive cases
fit <- auto.arima(cases_ts)

# Forecast the next 5 data points
forecasted_values <- forecast(fit, h=5)

# Plot the forecasted values
autoplot(forecasted_values)


install.packages("ggplot2")
install.packages("zoo")

library(ggplot2)
library(zoo)


covid_data <- data.frame(
  Date = seq(as.Date("2022-01-01"), as.Date("2022-12-31"), by = "days"),
  TotalCases = cumsum(sample(10:50, 365, replace = TRUE))
)

# Create a time series object
ts_data <- zoo(covid_data$TotalCases, covid_data$Date)

# Visualize the time series data using a line chart
ggplot(covid_data, aes(x = Date, y = TotalCases)) +
  geom_line() +
  labs(title = "Total Positive COVID-19 Cases Over Time",
       x = "Date",
       y = "Total Cases") +
  theme_minimal()



install.packages("ggplot2")
install.packages("zoo")

library(ggplot2)
library(zoo)


covid_data <- data.frame(
  Date = seq(as.Date("2022-01-01"), as.Date("2022-12-31"), by = "days"),
  TotalCases = cumsum(sample(10:50, 365, replace = TRUE))
)

# Create a time series object
ts_data <- zoo(covid_data$TotalCases, covid_data$Date)

# Visualize the time series data using a line chart
ggplot(covid_data, aes(x = Date, y = TotalCases)) +
  geom_line() +
  labs(title = "Total Positive COVID-19 Cases Over Time",
       x = "Date",
       y = "Total Cases") +
  theme_minimal()



#----------Multivariate----------

covid_data <- data.frame(
  Date = seq(as.Date("2022-01-01"), as.Date("2022-12-31"), by = "days"),
  TotalCases = cumsum(sample(10:50, 365, replace = TRUE)),
  TotalDeaths = cumsum(sample(1:10, 365, replace = TRUE))
)

# Create a multivariate time series object
ts_data <- zoo(cbind(covid_data$TotalCases, covid_data$TotalDeaths), covid_data$Date)

# Plot both series on a single chart
autoplot(ts_data, facets = NULL) +
  labs(title = "Total Positive COVID-19 Cases and Total Deaths Over Time",
       x = "Date",
       y = "Count") +
  scale_color_manual(values = c("blue", "red")) +
  theme_minimal()

#----------------Time series forecasting---------------


install.packages("forecast")
library(forecast)


covid_data <- data.frame(
  Date = seq(as.Date("2022-01-01"), as.Date("2022-12-31"), by = "days"),
  TotalCases = cumsum(sample(10:50, 365, replace = TRUE))
)

# Convert data to a time series object
ts_data <- ts(covid_data$TotalCases, frequency = 1)

# Fit an ARIMA model using auto.arima
arima_model <- auto.arima(ts_data)

# Forecast the next 5 data points
forecast_values <- forecast(arima_model, h = 5)

# Plot the forecasted values
plot(forecast_values, main = "ARIMA Forecast for Total Positive COVID-19 Cases",
     xlab = "Date", ylab = "Total Cases", xlim = c(2022, 2023))

# Add the actual data for comparison
lines(ts_data, col = "blue")
legend("topright", legend = c("Actual", "Forecast"), col = c("blue", "red"), lty = 1)

