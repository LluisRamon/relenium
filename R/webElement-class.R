#' Web Element class
#'
#' Some additional details about this S4 generic and its methods.
#' The extra blank line between this section and the title is.
#' 
#' @param ... Additional argument list that might not ever used.
#'
#' @return A webElement
#' 
#' @aliases initialize webElement-method
#' 
#' @author Aleix Ruiz de Villa, Andreu Vall, Lluís Ramon
#' @seealso \code{\link{firefox}}
#' 
#' @export
#' 


webElement <- setRefClass("webElement", fields = list(javaWebElement = "ANY"))

webElement$methods(initialize = function(javaObj){
  javaWebElement <<- javaObj
})
