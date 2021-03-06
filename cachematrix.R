## This script file contains functions that should be able to cache the 
## operation of getting the inverse of a matrix.

## This function: makeCacheMatrix, creates a special "matrix", which is really a
## list containing a function to
##     1. set the value of the matrix
##     2. get the value of the matrix
##     3. set the value of the inverse of the matrix
##     4. set the value of the inverse of the matrix
makeCacheMatrix <- function(x = matrix()) {
    ## Initialize stored matrix inverse to NULL
    matrixInverse <- NULL
    
    ## Set the value of matrix
    set <- function(y) {
        x <<- y
        matrixInverse <<- NULL
    }
    
    ## Get the value of matrix
    get <- function() x
    
    ## Set the matrix inverse
    setInverse <- function(inverse) matrixInverse <<- inverse
    
    ## Get the matrix inverse
    getInverse <- function() matrixInverse
    
    ## Return a list of the above-mentioned functions
    list(set = set, get = get, 
         setInverse = setInverse, 
         getInverse = getInverse)
}


## This function: cacheSolve, calculates the inverse of the special "matrix"
## created with the above function.  However, it checks to see if the inverse
## has already been calculated. If so, it gets the inverse of the matrix from
## the cache and skips the computation.  Otherwise, it calculates the inverse
## of the matrix and sets the value of the inverse of the matrix via the
## setInverse function.
cacheSolve <- function(x, ...) {
    
    ## Check if the inverse of the matrix has already been cached
    matrixInverse <- x$getInverse()
    
    if (!is.null(matrixInverse)) {
        
        message("getting cached inverse of matrix")
        
        ## Return cached inverse of matrix
        return(matrixInverse)
    }
    
    ## Inverse is not cached, so get the matrix and assign it to data
    data <- x$get()
    
    ## Compute the inverse of the matrix
    matrixInverse <- solve(data)
    
    ## Cache the inverse
    x$setInverse(matrixInverse)
    
    ## Return the inverse matrix of 'x'
    matrixInverse
}
