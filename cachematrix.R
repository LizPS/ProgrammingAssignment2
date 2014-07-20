## These functions together take an input matrix, calculate it's inverse and
## cache that inverse for future reuse. Note that cacheSolve is only
## applicable for square invertible matrices as solve() only works for square
## invertible matrices, and will throw an error if passed an "matrix object" 
## containing an insoluble matrix.

## This function creates a special "matrix object" that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
        cached_matrix <- NULL
        set <- function(y) {
                x <<- y
                cached_matrix <<- NULL
        }
        get <- function() {x}
        setinverse <- function(inverse) 
                {
                cached_matrix <<- inverse
                }
        getinverse <- function() {cached_matrix}
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}

## This function computes the inverse of the special "matrix" returned by 
## makeCacheMatrix above. If the inverse has already been calculated 
## (and the matrix has not changed), then cacheSolve retrieves the inverse from 
## the cache.

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

