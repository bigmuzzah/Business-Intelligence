
library(dplyr)
plot(Q10_Data$Time, Q10_Data$Speed_N, xlab = "Time of Day", ylab = "Speed")
model <- lm(Speed_N ~ Time, data = Q10_Data)
summary(model)
abline(model, col = "red")
cat("Coefficient:", coef(model)[2], "\n")
cat("Intercept:", coef(model)[1], "\n")

hist(Q10_Data, breaks = 20, main = "Speed Data Histogram", xlab = "Speed")


# Extract the speed column from the data
speed_data <- Q10_Data$Speed_N
speed_data <- scale(speed_data)

# Set the maximum number of clusters to try
max_clusters <- 10

# Create a vector to store the sum of squared errors for each cluster size
sse <- vector(mode = "numeric", length = max_clusters)

# Compute the sum of squared errors for each cluster size
for (k in 1:max_clusters) {
  km <- kmeans(speed_data, centers = k, nstart = 25)
  sse[k] <- km$tot.withinss
}

# Plot the elbow plot
plot(1:max_clusters, sse, type = "b", xlab = "Number of Clusters",
     ylab = "Sum of Squared Errors")





# Select the columns you want to use for clustering
cluster_data <- Q10_Data[, c("Speed_N", "Information_N")]

# Convert Information_N to 1 if it contains any data, and 0 if it is blank
cluster_data$Information_N <- ifelse(is.na(cluster_data$Information_N), 0, 1)

#scale Speed_N only
cluster_data$Speed_N <- scale(cluster_data$Speed_N)



# Run K-means clustering with 3 clusters
kmeans_clusters <- kmeans(cluster_data, centers = 2)

# View the cluster assignments for each data point
kmeans_clusters$cluster

library(ggplot2)

# Create a data frame with the scaled data and cluster assignments
cluster_df <- data.frame(cluster_data, cluster = kmeans_clusters$cluster)

# Create a scatter plot with different colors for each cluster
ggplot(cluster_df, aes(x = Speed_N, y = Information_N, color = as.factor(cluster))) +
  geom_point(size = 2) +
  xlab("Speed_N") +
  ylab("Information_N") +
  scale_color_discrete(name = "Cluster")


kmeans_clusters

