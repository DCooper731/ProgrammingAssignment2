makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y){     ## Set the value of the matrix
                x <<- y
                m <<- NULL
        }
        get <- function(){      ## Get the value of the matrix
                x
        }
                
        setmatrix <- function(solve){   ## Set the cached matrix
                m <<- solve       
        }
        getmatrix <- function() {       ## Get the cached matrix
                m
        }
        list(set=set, get=get, setmatrix=setmatrix, getmatrix=getmatrix)
}

cacheSolve <- function(x, ...) {
        m <- x$getmatrix()
        if(!is.null(m)){        ## Checks if the matrix was already solved
                message("getting cached data")
                return(m)       ## If solved already, displays cached solution
        }
        matrix <- x$get()       ## Otherwise, solves the matrix
        m <- solve(matrix, ...)
        x$getmatrix(m)
        m
}
