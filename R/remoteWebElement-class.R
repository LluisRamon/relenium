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
                                                                            javaWebElement = "ANY",
                                                                            methodNames = "character"))

remoteWebElementClass$methods(initialize = function(javaObj, ...){
  javaWebElement <<- javaObj
  javaKeys <<- javaKeysClass$new()
  
  # Method Names
  aux <- setRefClass("AuxRefClass")
  auxMeth <- c(aux$methods(), "initialize")
  objMeth <- getRefClass(class(.self))$methods()
  ind <- sapply(objMeth, function(obj){
    !(obj %in% auxMeth)
  })
  methodNames <<- objMeth[ind]
  
  callSuper(...)
})

remoteWebElementClass$methods(clear = function(){
  J(javaWebElement, "clear")
  return(invisible())
})

remoteWebElementClass$methods(click = function(){
  J(javaWebElement, "click")
  return(invisible())
})

remoteWebElementClass$methods(getAttribute = function(stringName){
  return(J(javaWebElement, "getAttribute", stringName))
})

remoteWebElementClass$methods(getCssValue = function(stringName){
  return(J(javaWebElement, "getCssValue", stringName))
})

remoteWebElementClass$methods(getId = function(){
  return(J(javaWebElement, "getId"))
})

remoteWebElementClass$methods(getSize = function(){
  return(J(javaWebElement, "getSize"))
})

remoteWebElementClass$methods(getTagName = function(){
  return(J(javaWebElement, "getTagName"))
})

remoteWebElementClass$methods(getText = function(){
  return(J(javaWebElement, "getText"))
})

remoteWebElementClass$methods(isDisplayed = function(){
  J(javaWebElement, "isDisplayed")
  return(invisible())
})

remoteWebElementClass$methods(isEnabled = function(){
  J(javaWebElement, "isEnabled")
  return(invisible())
})

remoteWebElementClass$methods(isSelected = function(){
  J(javaWebElement, "isSelected")
  return(invisible())
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

remoteWebElementClass$methods(submit = function(){
  J(javaWebElement, "submit")
  return(invisible())
})


.DollarNames.remoteWebElementClass <- function(x, pattern)
  grep(pattern, x$methodNames, value=TRUE)