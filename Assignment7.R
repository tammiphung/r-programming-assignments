
# Assignment #7: Generic Functions and S3 vs. S4
# Name: Tammi Phung

# 1. Choose and Inspect Data


# Load the built-in mtcars dataset
data("mtcars")

# Display the first six rows
head(mtcars)

# Describe the structure
str(mtcars)

# Check the class and underlying type
class(mtcars)
typeof(mtcars)



# 2. Test Generic Functions


# Generic function: print()
print(mtcars)

# Generic function: summary()
summary(mtcars)

# Generic function: plot()
plot(mtcars$wt, mtcars$mpg,
     main = "Car Weight vs. Miles Per Gallon",
     xlab = "Weight (1000 lbs)",
     ylab = "Miles Per Gallon",
     pch = 19)

# Check which methods are available
methods("print")
methods("summary")
methods("plot")

# Explanation:
# These functions are generics that can dispatch to
# methods based on the class of the supplied object.
# mtcars is a data frame, so class-specific methods
# may be used when available.
# For example, print.data.frame() handles printing
# a data frame, while summary() summarizes its columns.



# 3. Explore S3 Objects

# Create an S3 object
s3_obj <- list(name = "Myself", age = 29, GPA = 3.5)
class(s3_obj) <- "student_s3"

# Display the object
print(s3_obj)

# Define an S3 print method
print.student_s3 <- function(x, ...) {
  cat("S3 Student Object\n")
  cat("Name:", x$name, "\n")
  cat("Age:", x$age, "\n")
  cat("GPA:", x$GPA, "\n")
}

# Call the generic function
print(s3_obj)

# Inspect the S3 object
class(s3_obj)
typeof(s3_obj)
isS4(s3_obj)



# 4. Explore S4 Objects

# Define an S4 class
setClass("student_s4",
         slots = c(
           name = "character",
           age = "numeric",
           GPA = "numeric"
         ))

# Create an S4 object
s4_obj <- new("student_s4",
              name = "Myself",
              age = 29,
              GPA = 3.5)

# Define an S4 show method
setMethod("show", "student_s4",
          function(object) {
            cat("S4 Student Object\n")
            cat("Name:", object@name, "\n")
            cat("Age:", object@age, "\n")
            cat("GPA:", object@GPA, "\n")
          })

# Display the S4 object using the show generic
show(s4_obj)

# Inspect the S4 object
class(s4_obj)
typeof(s4_obj)
isS4(s4_obj)

# View the formal class definition
getClass("student_s4")

# Access individual slots
s4_obj@name
s4_obj@age
s4_obj@GPA



# 5. Compare S3 and S4

# S3 inspection
class(s3_obj)
attributes(s3_obj)

# S4 inspection
isS4(s4_obj)
slotNames(s4_obj)
getClass("student_s4")

