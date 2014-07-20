source('~/GitHub/ProgrammingAssignment2/cachematrix.R')

## These are some instances for testing cachematrix.R

b <- matrix(c(1,1,4,0,3,1,4,4,0), ncol=3) #this matrix can be inverted
c <- matrix(c(3,5,1,6,2,2,3,1,1), ncol=3) #no inverse exists for this matrix
f<-matrix(c(1,7,14,1i,1,6i,-1,-2i,1,-1,15,-1,1,-12i,-1,1i),nrow=4) #this matrix
#contains imaginary numbers, but is invertible, so it works

b_object <-makeCacheMatrix(b)
c_object <-makeCacheMatrix(c)
f_object <-makeCacheMatrix(f)
print(b)
print(cacheSolve(b_object)) #this will return the inverted matrix
print(cacheSolve(b_object)) #this will return the inverted matrix from the cache
print(f)
print(cacheSolve(f_object)) #this will return the inverted matrix
print(cacheSolve(f_object)) #this will return the inverted matrix from the cache

cacheSolve(c_object) #this will throw an error as c is not invertible