# The first function, makeCacheMatrix creates a special "matrix" 
# object that can cache the input matrix and its inverse
# If you for example set z <- makeCacheMatrix(matrix 1:4, 2,2), then you will get a 2,2
# matrix with data in a 1:4 for x

makeCacheMatrix <- function(x) {
  
  reversematrix <<- NULL
  # sets the value of reversematrix to NULL
  
  setmatrix <- function(y){
    reversematrix <<- y
    #set the value of the inverse matrix
    
  }
  getmatrix <- function(){
    reversematrix
    # return the value of the inverse matrix
    
  }
  
  originalmatrix <- x
  
  return(list(original=originalmatrix, setmatrix= setmatrix, getmatrix=getmatrix))
}

# This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
# If the inverse has already been calculated (and the matrix has not changed), 
# then the cachesolve should retrieve the inverse from the cache.
cacheSolve <- function(x) {
  
  if(is.null(x$getmatrix())) {
    
    solvedx <- solve(x$original)
    
    x$setmatrix(solvedx)
    return(x$getmatrix())
  }
  else {
    
    return(x$getmatrix())
  }
}