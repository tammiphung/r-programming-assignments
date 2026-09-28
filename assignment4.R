# Assignment 4
#Tammi Phung

# 1. Create the matrices
A <- matrix(1:100, nrow = 10)
B <- matrix(1:1000, nrow = 10)

# 2. Inspect dimensions
dim(A)
dim(B)

# 3. Compute inverse and determinant for A
invA <- tryCatch(
  solve(A),
  error = function(e) e
)

detA <- tryCatch(
  det(A),
  error = function(e) e
)

# 4. Compute inverse and determinant for B
invB <- tryCatch(
  solve(B),
  error = function(e) e
)

detB <- tryCatch(
  det(B),
  error = function(e) e
)

# 5. Display the results
cat("Dimensions of A:\n")
print(dim(A))

cat("\nDimensions of B:\n")
print(dim(B))

cat("\nInverse of A:\n")
print(invA)

cat("\nDeterminant of A:\n")
print(detA)

cat("\nInverse of B:\n")
print(invB)

cat("\nDeterminant of B:\n")
print(detB)

