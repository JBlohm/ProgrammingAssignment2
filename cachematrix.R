## Module Description:
##
## makeCacheMatrix: A function to create a matrix object that can cache its inverse
##
## cacheSolve: A function to compute the inverse of a matrix.
##             The result is stored in a cache.
##             If the inverse of the matix has already been calculated,
##             and the matrix is unchanged, 
##             the cached result will be returned.

## Function description:
## makeCacheMatrix: Returns a vector containing functions to
## - store a matrix object in cache
## - retrieve a matrix object from cache
makeCacheMatrix <- function(x = matrix()) {
        ## 'x' is a matrix object to be stored
  
        ## Initialize the cache to NULL
        mcache <- NULL
        
        ## SubFunctions to set/get the original matrix
        setMatrix <- function(y) {
                
        }
        getMatrix <- function() x
        
        ##Sub functions to set/get the inverse to/from cache
        setInverse <- function(inverse) mcache <<- inverse
        getInverse <- function() mcache
        
        ## Return the list of functions defined above
        list(setMatrix = setMatrix, getMatrix = getMatrix,
             setInverse = setInverse, getInverse = getInverse)
}


## Function description:
## cacheSolve: Return a matrix that is the inverse of 'x'
## If possible, retreive the matrix from cache, else recalculate.
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
