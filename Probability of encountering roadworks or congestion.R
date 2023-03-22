# Calculate the number of rows where there is an object in Information_N
num_objects <- sum(!is.na(Q10_Data$Information_N))

# Calculate the total number of rows in the data frame
total_rows <- nrow(Q10_Data)

# Calculate the probability of encountering an object in Information_N
prob <- num_objects/total_rows

# Print the result
cat("The probability of encountering an object in Information_N is", prob)

# Calculate the number of rows where there is an object in Information_S
num_objects <- sum(!is.na(Q10_Data$Information_S))

# Calculate the total number of rows in the data frame
total_rows <- nrow(Q10_Data)

# Calculate the probability of encountering an object in Information_S
prob <- num_objects/total_rows

# Print the result
cat("The probability of encountering an object in Information_S is", prob)
