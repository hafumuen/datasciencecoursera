## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## Plz see the comments below
## What we are requested to do is to cache the inverse of a matrix which is usually a time-consuming calculation process for the computer.
## So one would rather cache its inverse version than repeatedly computation.
## I use some functions to both generate a Matrix and cache its inverse. 


## This function creates a special "matrix" object that can cache its inverse.
makeCacheMatrix <- function(x = matrix()) {
         a <- NULL
         set<-function(y){
         	    x<<-y
         	    a <<- NULL
         }
         generate <-function() x
         setInverse <- function(inverse) a <<- inverse
         getInverse <- function() a
         list(set=set,
              generate= generate,
              setInverse= setInverse,
              getInverse= getInverse
         )
         
}



## Write a short comment describing this function
## This function could retrive the inverse of appointed "matrix" from the cashe created by the above function if the matrix remains the same.



cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  in_verse <- x$getInverse()
  if(!is.null(in_verse)) {
    message("caching data")
    return(in_verse)
  }
  ma <- x$get()
  in_verse <- solve(ma, ...)
  x$setInverse(in_verse)
  in_verse
}

## The best time is when we validate these functions
## This is to load my file at first, but one may change the directory for his own

source("/Users/jungle_d/Desktop/Databox Specialization/R data/ProgrammingAssignment2-master/cachematrix.R")
my_matrix <- makeCacheMatrix(matrix(1:4, 2, 2))
my_matrix$get()

my_matrix$getInverse()
##Here I have a problem that if I dont reload the CacheSolve function
## It would go directly to "NULL"
## So I have to reload
cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  in_verse <- x$getInverse()
  if(!is.null(in_verse)) {
    message("caching data")
    return(in_verse)
  }
  ma <- x$get()
  in_verse <- solve(ma, ...)
  x$setInverse(in_verse)
  in_verse
}
cacheSolve(my_matrix)
cacheSolve(my_matrix)

my_matrix$getInverse()

my_matrix$set(matrix(c(3, 9, 1, 8), 2, 2))
my_matrix$get()

my_matrix$getInverse()

cacheSolve(my_matrix)
cacheSolve(my_matrix)

my_matrix$getInverse()


