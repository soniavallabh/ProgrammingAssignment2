
# The makeCacheMatrix function takes one argument, x, a matrix. It initializes v, the variable that will eventually store the
# inverse of our matrix, with a value of NULL. Sub-functions set, get, setinverse, and getinverse do the following:
# 1) set sets a new variable, y, equal to x, and sets v equal to NULL, both in the broader environment beyond the function 
# 2) get reports the value of x
# 3) setinverse stores a value that you pass to it in v
# 4) getinverse reports the value stored in v
## Write a short comment describing this function

# The cacheSolve function takes one argument, x, the list output by makeCacheMatrix. It calls the getinverse"function and
# stores the value in v. If v is not null, the cacheSolve function reports that it is "getting cached data", and then 
# returns the value stored in v.
# Otherwise, there is no inverse matrix stored in value v, so cacheSolve calls the get function to retrieve the value of x (our
# original matrix) and stores this in the variable data. Next, the solve function is perfomed on data to take the inverse of the 
# matrix, and the result is stored in v by calling the setinverse function.  Finally, v, now containing the value the inverse 
# matrix, is returned.



# The makeCacheMatrix function takes a matrix as its sole argument and returns a list of sub-functions that will be 
# helpful in determining and caching the inverse of the matrix.
  
makeCacheMatrix <- function(x = matrix()) {
  v <- NULL
  set <- function(y) {
    x <<- y
    v <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) v <<- inverse
  getinverse <- function() v
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


# The cacheSolve function takes a the list of sub-functions generated by makeCacheMatrix and returns the inverse of the matrix x.
# It does this either by 1) fetching the already-calculated inverse, or b) calculating the inverse using the solve function. 

cacheSolve <- function(x, ...) {
  v <- x$getinverse()
  if(!is.null(v)) {
    message("getting cached data")
    return(v)
  }
  data <- x$get()
  v <- solve(data, ...)
  x$setinverse(v)
  v
}