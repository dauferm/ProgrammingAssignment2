## The following is a pair of functions that cache and compute the 
## inverse of a matrix.

## This function creates a special matrix object that caches its inverse.

makeCacheMatrix <- function(mat = matrix()) {
  inverse <- NULL
  set <- function(x) {
    mat <<- x;
    inverse <<- NULL;
  }
  get <- function() return(mat);
  setinv <- function(inv) inverse <<- inv;
  getinv <- function() return(inverse);
  return(list(set = set, get = get, setinv = setinv, getinv = getinv))
}

## This function computes the inverse of the special matrix 
## returned by makeCacheMatrix. If the inverse has already 
## been calculated cacheSolve gets the inverse from the cache.

cacheSolve <- function(mat) {
  inverse <- mat$getinv()
  if(!is.null(inverse)) {
    message("Getting cached data...")
    return(inverse)
  }
  data <- mat$get()
  invserse <- solve(data)
  mat$setinv(inverse)
  return(inverse)
}
