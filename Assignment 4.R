# Assignment #4 - Data Cleaning and Visualization

# Create vectors
Frequency <- c(0.6, 0.3, 0.4, 0.4, 0.2, 0.6, 0.3, 0.4, 0.9, 0.2)

BloodPressure <- c(103, 87, 32, 42, 59, 109, 78, 205, 135, 176)

FirstAssess <- c(1, 1, 1, 1, 0, 0, 0, 0, NA, 1)
# bad = 1, good = 0

SecondAssess <- c(0, 0, 1, 1, 0, 0, 1, 1, 1, 1)
# low = 0, high = 1

FinalDecision <- c(0, 1, 0, 1, 0, 1, 0, 1, 1, 1)
# low = 0, high = 1

# Create data frame
df_hosp <- data.frame(
  Frequency,
  BloodPressure,
  FirstAssess,
  SecondAssess,
  FinalDecision,
  stringsAsFactors = FALSE
)

# Inspect the data
summary(df_hosp)

# Check for missing values
is.na(df_hosp)

# Remove rows containing NA
df_hosp <- na.omit(df_hosp)

# Check cleaned data
summary(df_hosp)
df_hosp

# -----------------------------------------
# SIDE-BY-SIDE BOXPLOTS
# -----------------------------------------

# BP by First MD Assessment
png("BP_First_Assessment.png", width = 800, height = 600)

boxplot(
  BloodPressure ~ FirstAssess,
  data = df_hosp,
  names = c("Good", "Bad"),
  ylab = "Blood Pressure",
  xlab = "First MD Assessment",
  main = "Blood Pressure by First MD Assessment"
)

dev.off()


# BP by Second MD Assessment
png("BP_Second_Assessment.png", width = 800, height = 600)

boxplot(
  BloodPressure ~ SecondAssess,
  data = df_hosp,
  names = c("Low", "High"),
  ylab = "Blood Pressure",
  xlab = "Second MD Assessment",
  main = "Blood Pressure by Second MD Assessment"
)

dev.off()


# BP by Final Decision
png("BP_Final_Decision.png", width = 800, height = 600)

boxplot(
  BloodPressure ~ FinalDecision,
  data = df_hosp,
  names = c("Low", "High"),
  ylab = "Blood Pressure",
  xlab = "Final Decision",
  main = "Blood Pressure by Final Decision"
)

dev.off()


# -----------------------------------------
# HISTOGRAMS
# -----------------------------------------

# Histogram of Frequency
png("Frequency_Histogram.png", width = 800, height = 600)

hist(
  df_hosp$Frequency,
  breaks = seq(0, 1, by = 0.1),
  xlab = "Visit Frequency",
  main = "Histogram of Visit Frequency"
)

dev.off()


# Histogram of Blood Pressure
png("BloodPressure_Histogram.png", width = 800, height = 600)

hist(
  df_hosp$BloodPressure,
  breaks = 8,
  xlab = "Blood Pressure",
  main = "Histogram of Blood Pressure"
)

dev.off()

