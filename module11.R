
# Module 11: Debugging and Defensive Programming

# 1. Define the Tukey outlier function
tukey.outlier <- function(x) {
  q <- quantile(x, c(0.25, 0.75), na.rm = TRUE)
  iqr <- IQR(x, na.rm = TRUE)
  
  x < (q[1] - 1.5 * iqr) |
    x > (q[2] + 1.5 * iqr)
}

# 2. Original buggy function
tukey_multiple <- function(x) {
  outliers <- array(TRUE, dim = dim(x))
  
  for (j in 1:ncol(x)) {
    outliers[, j] <- outliers[, j] &&
      tukey.outlier(x[, j])
  }
  
  outlier.vec <- vector("logical", length = nrow(x))
  
  for (i in 1:nrow(x)) {
    outlier.vec[i] <- all(outliers[i, ])
  }
  
  return(outlier.vec)
}

# 3. Create test matrix
set.seed(123)
test_mat <- matrix(rnorm(50), nrow = 10)

# 4. Run original function
# This demonstrates the logical operator bug.
original_result <- tukey_multiple(test_mat)

# 5. Corrected function with defensive checks
corrected_tukey <- function(x) {
  
  # Check that x is a matrix
  if (!is.matrix(x)) {
    stop("Error: x must be a matrix.")
  }
  
  # Check that x contains numeric values
  if (!is.numeric(x)) {
    stop("Error: x must contain numeric values.")
  }
  
  # Check matrix dimensions
  if (nrow(x) == 0 || ncol(x) == 0) {
    stop("Error: x must have at least one row and column.")
  }
  
  # Initialize outlier matrix
  outliers <- array(TRUE, dim = dim(x))
  
  # Apply Tukey rule element-wise
  for (j in seq_len(ncol(x))) {
    outliers[, j] <- outliers[, j] &
      tukey.outlier(x[, j])
  }
  
  # Identify rows that are outliers in every column
  outlier.vec <- logical(nrow(x))
  
  for (i in seq_len(nrow(x))) {
    outlier.vec[i] <- all(outliers[i, ])
  }
  
  return(outlier.vec)
}

# 6. Validate corrected function
corrected_result <- corrected_tukey(test_mat)

# Display results
print(test_mat)
print(corrected_result)

# Confirm output
print(is.logical(corrected_result))
print(length(corrected_result))

# Expected validation:
# TRUE
# 10

