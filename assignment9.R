
# Assignment #9: Comparing R Visualization Systems
# Dataset: mtcars
# Systems: Base R, lattice, and ggplot2

# -----------------------------------------
# 1. Load the dataset
# -----------------------------------------

data("mtcars", package = "datasets")

# View the dataset
head(mtcars)
str(mtcars)
names(mtcars)

# Convert cylinders to a factor for grouping
mtcars$cyl <- factor(mtcars$cyl)

# Create a folder for the plots
if (!dir.exists("assignment9_plots")) {
  dir.create("assignment9_plots")
}

# -----------------------------------------
# 2. Base R Graphics
# -----------------------------------------

# Plot 1: Car weight versus fuel efficiency
png("assignment9_plots/base_scatter.png",
    width = 900, height = 650)

plot(mtcars$wt, mtcars$mpg,
     main = "Base R: Car Weight vs. Fuel Efficiency",
     xlab = "Weight (1000 lbs)",
     ylab = "Miles per Gallon (MPG)",
     pch = 19,
     col = "steelblue")

dev.off()

# Plot 2: Distribution of fuel efficiency
png("assignment9_plots/base_histogram.png",
    width = 900, height = 650)

hist(mtcars$mpg,
     main = "Base R: Distribution of Fuel Efficiency",
     xlab = "Miles per Gallon (MPG)",
     ylab = "Frequency",
     col = "lightblue",
     border = "white")

dev.off()

# -----------------------------------------
# 3. Lattice Graphics
# -----------------------------------------

library(lattice)

# Plot 3: Weight versus MPG by cylinder group
png("assignment9_plots/lattice_scatter.png",
    width = 1000, height = 650)

print(
  xyplot(mpg ~ wt | cyl,
         data = mtcars,
         main = "Lattice: Weight vs. MPG by Cylinders",
         xlab = "Weight (1000 lbs)",
         ylab = "Miles per Gallon (MPG)",
         pch = 19,
         col = "darkgreen",
         layout = c(3, 1))
)

dev.off()

# Plot 4: Fuel efficiency by cylinder group
png("assignment9_plots/lattice_boxplot.png",
    width = 900, height = 650)

print(
  bwplot(mpg ~ cyl,
         data = mtcars,
         main = "Lattice: Fuel Efficiency by Cylinders",
         xlab = "Number of Cylinders",
         ylab = "Miles per Gallon (MPG)",
         col = "lightgreen",
         fill = "lightgreen")
)

dev.off()

# -----------------------------------------
# 4. ggplot2
# -----------------------------------------

library(ggplot2)

# Plot 5: Scatter plot with linear trend
p1 <- ggplot(mtcars, aes(x = wt, y = mpg, color = cyl)) +
  geom_point(size = 3) +
  geom_smooth(method = "lm", se = FALSE) +
  labs(
    title = "ggplot2: Weight vs. Fuel Efficiency",
    x = "Weight (1000 lbs)",
    y = "Miles per Gallon (MPG)",
    color = "Cylinders"
  ) +
  theme_minimal()

print(p1)

ggsave("assignment9_plots/ggplot_scatter.png",
       plot = p1, width = 9, height = 6, dpi = 300)

# Plot 6: Fuel efficiency distribution by cylinders
p2 <- ggplot(mtcars, aes(x = mpg)) +
  geom_histogram(binwidth = 2, fill = "cornflowerblue",
                 color = "white") +
  facet_wrap(~cyl) +
  labs(
    title = "ggplot2: Fuel Efficiency by Cylinder Group",
    x = "Miles per Gallon (MPG)",
    y = "Frequency"
  ) +
  theme_minimal()

print(p2)

ggsave("assignment9_plots/ggplot_histogram.png",
       plot = p2, width = 9, height = 6, dpi = 300)



