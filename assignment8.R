
# Assignment 8: Reading, Filtering, and Writing Data Files

# Import Assignment 6 data
student6 <- read.csv(
  file.choose(),
  header = TRUE,
  stringsAsFactors = FALSE
)
# View the data and check column names
print(student6)
str(student6)
names(student6)

# Check that required columns exist
required_columns <- c("Name", "Sex", "Grade")

if (!all(required_columns %in% names(student6))) {
  stop("The dataset must contain Name, Sex, and Grade columns.")
}

# Load plyr package
if (!requireNamespace("plyr", quietly = TRUE)) {
  install.packages("plyr")
}
library(plyr)

# Calculate average grade by sex
gender_mean <- ddply(
  student6,
  "Sex",
  summarise,
  GradeAverage = mean(Grade, na.rm = TRUE)
)

# Display grouped averages
print(gender_mean)

# Export grouped averages to a tab-delimited text file
write.table(
  gender_mean,
  file = "gender_mean.txt",
  sep = "\t",
  row.names = FALSE
)

# Step 2: Filter names containing "i" or "I"
i_students <- subset(
  student6,
  grepl("i", Name, ignore.case = TRUE)
)

# Display filtered names
print(i_students$Name)

# Export names only to a CSV file
write.csv(
  i_students$Name,
  file = "i_students.csv",
  row.names = FALSE,
  quote = FALSE
)

# Step 3: Export the complete filtered dataset
write.csv(
  i_students,
  file = "i_students_full.csv",
  row.names = FALSE
)

# Confirm that all three files were created
output_files <- c(
  "gender_mean.txt",
  "i_students.csv",
  "i_students_full.csv"
)

print(file.exists(output_files))
print(getwd())


