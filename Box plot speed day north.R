#box plots for day for Speed_North

library(ggplot2)
Q10_Data$Day <- factor(Q10_Data$Day, levels = c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"))

ggplot(Q10_Data, aes(x = Day, y = Speed_N)) +
  geom_boxplot() +
  labs(x = "Day", y = "Speed_N")


#box plot for hours

library(dplyr)
library(ggplot2)

# Convert the Time variable to a POSIXct object
Q10_Data$Time <- as.POSIXct(Q10_Data$Time, format = "%m/%d/%Y %H:%M:%S")

# Group the data by 1 hour intervals and keep the raw Speed_N data for each group
Q10_Data_hourly <- Q10_Data %>%
  mutate(hour = format(Time, "%H")) %>%
  group_by(hour) %>%
  mutate(hourly_speed = Speed_N)

# Create a box plot with the x-axis representing the hour intervals and the y-axis representing the raw Speed_N data
ggplot(Q10_Data_hourly, aes(x = hour, y = hourly_speed)) +
  geom_boxplot() +
  labs(x = "Hour of Day", y = "Speed_N")



