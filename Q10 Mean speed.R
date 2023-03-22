library(dplyr)
library(lubridate)

# assume your data frame is called "Q10_Data"
Q10_Data1 <- Q10_Data %>%
  mutate(Time = as.POSIXct(Time, format = "%m/%d/%Y %H:%M:%S")) %>%
  mutate(hour = round_date(Time, unit = "hour")) %>%
  group_by(hour) %>%
  summarise(mean_speed = mean(Speed_N, na.rm = TRUE))

# view the resulting data frame
Q10_Data1

#plot a graph
ggplot(Q10_Data1, aes(x = hour, y = mean_speed)) + geom_line()

# Perform polynomial regression on the data
poly_fit <- lm(mean_speed ~ poly(hour, 2), data = Q10_Data1)

# Add the polynomial regression curve to the line plot
ggplot(Q10_Data1, aes(x = hour, y = mean_speed)) +
  geom_line() +
  geom_smooth(method = "lm", formula = y ~ poly(x, 2), se = FALSE)
