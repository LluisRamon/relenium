#' remote Web Element class
#'
#' Some additional details about this S4 generic and its methods.
#' The extra blank line between this section and the title is.
#' 
#' @param ... Additional argument list that might not ever used.
#'
#' @return A remoteWebElementClass
#' 
#' @aliases initialize remoteWebElementClass-method
#' 
#' @author Aleix Ruiz de Villa, Andreu Vall, Llu?s Ramon
#' @seealso \code{\link{firefox}}
#' 
#' @export
#' 


remoteWebElementClass <- setRefClass("remoteWebElementClass", fields = list(javaKeys = "javaKeysClass", 
                                                                  javaWebElement = "ANY"))

remoteWebElementClass$methods(initialize = function(javaObj, ...){
  javaWebElement <<- javaObj
  javaKeys <<- javaKeysClass$new()
  
  callSuper(...)
})

remoteWebElementClass$methods(sendKeys = function(text = NULL, keys = NULL){
  
  if ( is.null(keys) ){
    textSearch <- .jarray( text )
    J(javaWebElement, "sendKeys", textSearch)
  }else{
    J(javaWebElement, "sendKeys", javaKeys$keysArray[[keys]])
  }
  
  return(invisible())
})