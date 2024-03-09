## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  
  # Initialize the inverse matrix as NULL
  inv <- NULL
  
  # Function to set the matrix
  set <- function(y) {
    
    # Using <<- to assign the value in the parent environment
    x <<- y
    # Reset the cached inverse
    inv <<- NULL
    
  }
  
  # Function to get the matrix
  get <- function() {
    # Return the matrix
    x
  }
  
  # Function to get the cached inverse
  getInverse <- function() {
    # Using <<- to assign the value in the parent environment
    inv
  }
  
  # Function to set the cached inverse
  setInverse <- function(inverse) {
    # Using <<- to assign the value in the parent environment
    inv <<- inverse
  }
  
  # Return a list of functions
  list(set = set, get = get, getInverse = getInverse, setInverse = setInverse)

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  # Get the cached inverse
  inv <- x$getInverse()
  
  # If the cached inverse is not NULL, return it
  if(!is.null(inv)) {
    return(inv)
  }
  
  #If the cached inverse is NULL, compute the inverse and cache it
  data <- x$get()
  inv <- solve(data, ...)
  x$setInverse(inv)
  
  # Return the computed inverse
  inv
}

## Example
## x = matrix(1:4, nrow = 2)

## > x
##      [,1] [,2]
## [1,]    1    3
## [2,]    2    4

## > makeCacheMatrix(x)$get()
##      [,1] [,2]
## [1,]    1    3
## [2,]    2    4

## > cacheSolve(makeCacheMatrix(x))
##      [,1] [,2]
## [1,]   -2  1.5
## [2,]    1 -0.5
