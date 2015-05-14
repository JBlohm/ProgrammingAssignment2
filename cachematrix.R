## Module Description:
##
## Module created 13-14. May 2015 by JBlohm
##
## makeCacheMatrix: A function to create a matrix object that can cache its inverse
##
## cacheSolve: A function to compute the inverse of a matrix.
##             The result is stored in a cache.
##             If the inverse of the matix has already been calculated,
##             and the matrix is unchanged, 
##             the cached result will be returned.
##
## Usage examples:
##
##> x <- makeCacheMatrix(matrix(c(0,1,2,0),2,2))
##> x$getMatrix()
##[,1] [,2]
##[1,]    0    2
##[2,]    1    0
##> cacheSolve(x)
##[,1] [,2]
##[1,]  0.0    1
##[2,]  0.5    0
##> cacheSolve(x)
##returning cached data
##[,1] [,2]
##[1,]  0.0    1
##[2,]  0.5    0
##> x$setMatrix(matrix(c(0,1,5,0),2,2))
##> cacheSolve(x)
##[,1] [,2]
##[1,]  0.0    1
##[2,]  0.2    0
##> cacheSolve(x)
##returning cached data
##[,1] [,2]
##[1,]  0.0    1
##[2,]  0.2    0
##> 


## Function description:
## makeCacheMatrix: Returns a vector containing functions to
## - store a matrix object in cache
## - retrieve a matrix object from cache
makeCacheMatrix <- function(x = matrix()) {
        ## 'x' is a matrix object to be stored
  
        ## Initialize the cache to NULL
        mcache <- NULL
        
        ## SubFunction to set the original matrix
        setMatrix <- function(y) {
                x <<- y
                mcache <<- NULL
        }
        
        ## SubFunction to get the original matrix
        getMatrix <- function() x
        
        ##Sub functions to store (set) the inverse to cache
        setInverse <- function(inverse) mcache <<- inverse
        
        ##Sub functions to retrieve (get) the inverse from cache
        getInverse <- function() mcache
        
        ## Return the list of functions defined above
        list(setMatrix = setMatrix, getMatrix = getMatrix,
             setInverse = setInverse, getInverse = getInverse)
}


## Function description:
## cacheSolve: Return a matrix that is the inverse of 'x'
## If possible, retreive the inverse matrix from cache, else recalculate.
cacheSolve <- function(x, ...) {
        ## 'x' is a cacheMatrix object created with makeCacheMatrix()

        ## Get the current cache of the cacheMatrix object
        ## which could be an inverse of the original matrix,
        ## or a NULL if the cache is invalid.
        mcache <- x$getInverse()
        
        ## If the cache is valid, return the cached matrix.
        if(!is.null(mcache)) {
                message("returning cached data")
                return(mcache)
        }
  
        ## Cache is invalid if we get here, so we need to calculate the inverse
        ## of the matrix.
        
        ## Get the matrix
        mdata <- x$getMatrix()
        ## solve it to get the inverse
        minverse <- solve(mdata)
        ## store result in cache
        x$setInverse(minverse)
        
        ## Return the matrix that is the inverse of 'x'
        minverse
}
