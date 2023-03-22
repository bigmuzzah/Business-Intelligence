#Correlation between Speed and Time

Q10_Data$Time <- as.numeric(as.POSIXct(Q10_Data$Time, format = "%m/%d/%Y %H:%M:%S"))

# Calculate the correlation between Speed_N and Time
correlation <- cor(Q10_Data$Speed_N, Q10_Data$Time, use = "complete.obs")

# Print the correlation coefficient
cat("Correlation coefficient:", correlation)


#Correlation between speed and Roadsigns

# Convert Information_N to binary
Q10_Data$Information_N_binary <- ifelse(is.na(Q10_Data$Information_N), 0, 1)

# Calculate correlation coefficient
cor(Q10_Data$Speed_N, Q10_Data$Information_N_binary, use = "complete.obs")


library(ggplot2)

ggplot(Q10_Data, aes(x = Speed_N, y = Information_N_binary)) +
  geom_point() +
  geom_smooth(method = "lm") +
  labs(x = "Speed_N", y = "Information_N_binary")

