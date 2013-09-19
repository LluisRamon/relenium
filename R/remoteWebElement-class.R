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
                                                                            javaSelect = "ANY",
                                                                            keys = "character",
                                                                            methodNames = "character"))

remoteWebElementClass$methods(initialize = function(javaObj, ...){
  javaWebElement <<- javaObj
  javaKeys <<- javaKeysClass$new()
  keys <<- javaKeys$keysNames

#   browser()
  if(javaWebElement$getTagName() == "select"){
    javaSelect <<- new(J("org.openqa.selenium.support.ui.Select"), javaObj)
  }else{
    javaSelect <<- NULL
  }
  javaSelectMethods <- c("isMultiple", "getOptions", "deselectAll",
                         "getAllSelectedOptions", "getFirstSelectedOption",
                         "selectByVisibleText", "selectByIndex", 
                         "selectByValue", "deselectByValue", 
                         "deselectByIndex", "deselectByVisibleText")
  
  # Method Names
  aux <- setRefClass("AuxRefClass")
  auxMeth <- c(aux$methods(), "initialize")
  objMeth <- getRefClass(class(.self))$methods()
  ind <- sapply(objMeth, function(obj){
    !(obj %in% auxMeth)
  })
  methodNames <<- c(objMeth[ind], "keys")
  
  if( !is.null(javaSelect) ){
    methodNames <<- c(methodNames, javaSelectMethods)  
  }
  
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

remoteWebElementClass$methods(deselectAll = function(){
  if( !is.null( javaSelect) ){
    J(javaSelect, "deselectAll")  
  }
  return(invisible())
})

remoteWebElementClass$methods(deselectByIndex = function(ind){
  if( !is.null( javaSelect) ){
    J(javaSelect, "deselectByIndex", ind)  
  }
  return(invisible())
})

remoteWebElementClass$methods(deselectByValue = function(characterName){
  if( !is.null( javaSelect) ){
    J(javaSelect, "deselectByValue", characterName)  
  }
  return(invisible())
})

remoteWebElementClass$methods(deselectByVisibleText = function(characterName){
  if( !is.null( javaSelect) ){
    J(javaSelect, "deselectByVisibleText", characterName)  
  }
  return(invisible())
})



# find element by and find elements by
findNames <- c("ByClassName", "ByCssSelector", "ById",
               "ByLinkText", "ByName", "ByPartialLinkText",
               "ByTagName", "ByXPath")

findNamesS <- paste("findElement", findNames, sep = "")
resFun <- lapply(findNamesS, function(auxN){
  bodyTxt <- paste("{webElement <- remoteWebElementClass$new(J(javaDriver, '", auxN, "', argName))
                   return(webElement)}", sep = "")
  auxFun <- function(argName){print(3)}
  body(auxFun) <- {parse(text = bodyTxt)}
  return(auxFun)
  })
names(resFun) <- findNamesS
remoteWebElementClass$methods(resFun)

findNamesP <- paste("findElements", findNames, sep = "")
resFun <- lapply(findNamesP, function(auxN){
  bodyTxt <- paste("{elements <- J(javaDriver, ", auxN,
                   ", argName); elements <- as.list(elements)
  elements <- lapply(elements, function(javaObject){
    webElemAux <- remoteWebElementClass$new(javaObject)
    return(webElemAux)
  })
  return(elements)}", sep = "")
  auxFun <- function(argName){print(3)}
  body(auxFun) <- {parse(text = bodyTxt)}
  return(auxFun)
})
names(resFun) <- findNamesP
remoteWebElementClass$methods(resFun)

rm(findNames)
rm(findNamesS)
rm(findNamesP)
rm(resFun)


remoteWebElementClass$methods(getAllSelectedOptions = function(){
  if( !is.null( javaSelect) ){
    elements <- J(javaSelect, "getAllSelectedOptions")  
    elements <- as.list(elements)
    elements <- lapply(elements, function(javaObject){
      webElemAux <- remoteWebElementClass$new(javaObject)
      return(webElemAux)
    })
    return(elements)
  }else{
    return(invisible())  
  }
})

remoteWebElementClass$methods(getAttribute = function(stringName){
  return(J(javaWebElement, "getAttribute", stringName))
})

remoteWebElementClass$methods(getCssValue = function(stringName){
  return(J(javaWebElement, "getCssValue", stringName))
})

remoteWebElementClass$methods(getFirstSelectedOption = function(){
  if( !is.null( javaSelect) ){
    element <- J(javaSelect, "getFirstSelectedOption")  
    element <- remoteWebElementClass$new((element)
    return(element)
  }else{
    return(invisible())  
  }
})

remoteWebElementClass$methods(getHtml = function(){
  return(.self$getAttribute("innerHTML"))
})

remoteWebElementClass$methods(getId = function(){
  return(J(javaWebElement, "getId"))
})

remoteWebElementClass$methods(getOptions = function(){
  if( !is.null( javaSelect) ){
    J(javaSelect, "getOptions")  
  }
  return(invisible())
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

remoteWebElementClass$methods(isMultiple = function(){
  if( !is.null( javaSelect) ){
    J(javaSelect, "isMultiple")  
  }
  return(invisible())
})


remoteWebElementClass$methods(isSelected = function(){
  J(javaWebElement, "isSelected")
  return(invisible())
})

remoteWebElementClass$methods(selectByIndex = function(ind){
  if( !is.null( javaSelect) ){
    J(javaSelect, "selectByIndex", ind)  
  }
  return(invisible())
})

remoteWebElementClass$methods(selectByValue = function(characterName){
  if( !is.null( javaSelect) ){
    J(javaSelect, "selectByValue", characterName)  
  }
  return(invisible())
})

remoteWebElementClass$methods(selectByVisibleText = function(characterName){
  if( !is.null( javaSelect) ){
    J(javaSelect, "selectByVisibleText", characterName)  
  }
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