## These series of functions create and cache an inverse matrix.
## First, the matrix to be inversed is passed to makeCacheMatrix.
## Then, cacheSolve can call upon the list of functions to determine
## if there is an inverse matrix and if not to then create one.


## makeCacheMatrix accepts a matrix argument.
## makeCacheMatrix returns a list of functions.
    ## get() returns the "x" argument from makeCacheMatrix,
    ## get() also returns "x" from set(y) because of x <<- y.
    ## getinverse() returns the inverse matrix "i" (which is initially NULL),
    ## getinverse() also returns "i" from setinverse(inverse) because of i <<- inverse.
    ## set(y) modifies "x" within the makeCacheMatrix() environment because of x <<- y.
    ## setinverse(inverse) modifies "i" within the makeCacheMatrix() environment because of i <<- inverse.

makeCacheMatrix <- function(x = matrix()) {
   
    i <- NULL
    
    {
    set <- function(y) {x <<- y; i <<- NULL}
    get <- function() x
    setinverse <- function(inverse) i <<- inverse
    getinverse <- function() i
    }
    
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
    
}


## cacheSolve retrieves "i".
## cacheSolve then determines if "i" is NOT NULL
    ## If TRUE, and "i" is NOT NULL
        ## cacheSolve returns "i" with a message indicating that it was cached.
    
    ## If FALSE, and "i" is NULL
        ## cacheSolve gets matrix "x", calls solve(x) to find the inverse,
        ## sets the inverse with setinverse(), and then returns the inverse "i"

cacheSolve <- function(x, ...) {
    
    i <- x$getinverse()
    if(!is.null(i)) {
        message("getting cached data")
        return(i)
    }
    data <- x$get()
    i <- solve(data, ...)
    x$setinverse(i)
    i

}
