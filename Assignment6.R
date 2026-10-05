# Assignment #6 - Matrix Operations

# ---------------------------------
# Task 1: Matrix Addition & Subtraction
# ---------------------------------

A <- matrix(c(2, 0, 1, 3), ncol = 2)
B <- matrix(c(5, 2, 4, -1), ncol = 2)

# Display matrices
A
B

# Matrix addition
A + B

# Matrix subtraction
A - B


# ---------------------------------
# Task 2: Create a Diagonal Matrix
# ---------------------------------

D <- diag(c(4, 1, 2, 3))

# Display the diagonal matrix
D


# ---------------------------------
# Task 3: Construct a Custom 5 x 5 Matrix
# ---------------------------------

C <- matrix(c(
  3, 2, 2, 2, 2,
  1, 3, 0, 0, 0,
  1, 0, 3, 0, 0,
  1, 0, 0, 3, 0,
  1, 0, 0, 0, 3
), nrow = 5, ncol = 5)

# Display the custom matrix
C