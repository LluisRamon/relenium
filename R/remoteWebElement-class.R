remoteWebElementClass <- setRefClass("remoteWebElementClass", fields = list(javaKeys = "javaKeysClass", 
                                                                            javaWebElement = "ANY",
                                                                            javaSelect = "ANY",
                                                                            keys = "character"), 
                                     contains = "exceptionClass")

remoteWebElementClass$methods(initialize = function(javaObj, ...){
  javaWebElement <<- javaObj
  javaKeys <<- javaKeysClass$new()
  keys <<- javaKeys$keysNames

#   javaWebElement$execute()
#   javaWebElement$execute("return arguments[0].attributes);")

  if(javaWebElement$getTagName() == "select"){
    javaSelect <<- .self$tryExc(new(J("org.openqa.selenium.support.ui.Select"), javaObj))
    if( is.null(javaSelect) ){
      stop("select tag object creation failed")
    }
  }else{
    javaSelect <<- NULL
  }
  
  callSuper(...)
})

remoteWebElementClass$methods(clear = function(){
  .self$tryExc(J(javaWebElement, "clear"))
  return(invisible())
})

remoteWebElementClass$methods(click = function(){
  .self$tryExc(J(javaWebElement, "click"))
  return(invisible())
})

remoteWebElementClass$methods(deselectAll = function(){
  if( !is.null( javaSelect) ){
    .self$tryExc(J(javaSelect, "deselectAll"))
  }
  return(invisible())
})

remoteWebElementClass$methods(deselectByIndex = function(ind){
  if( !is.null( javaSelect) ){
    .self$tryExc(J(javaSelect, "deselectByIndex", ind))
  }
  return(invisible())
})

remoteWebElementClass$methods(deselectByValue = function(characterName){
  if( !is.null( javaSelect) ){
    .self$tryExc(J(javaSelect, "deselectByValue", characterName))
  }
  return(invisible())
})

remoteWebElementClass$methods(deselectByVisibleText = function(characterName){
  if( !is.null( javaSelect) ){
    .self$tryExc(J(javaSelect, "deselectByVisibleText", characterName))
  }
  return(invisible())
})



# find element by and find elements by
findNames <- c("ByClassName", "ByCssSelector", "ById",
               "ByLinkText", "ByName", "ByPartialLinkText",
               "ByTagName", "ByXPath")

findNamesS <- paste("findElement", findNames, sep = "")
resFun <- lapply(findNamesS, function(auxN){
  bodyTxt <- paste("{
    webElement <- .self$tryExc(J(javaDriver, '", auxN, "', argName))
    if( !is.null(webElement) ){
      webElement <- remoteWebElementClass$new(webElement)
      return(webElement)
    }else{
      return(NULL)
    }
  }", sep = "")
  auxFun <- function(argName){print(3)}
  body(auxFun) <- {parse(text = bodyTxt)}
  return(auxFun)
  })
names(resFun) <- findNamesS
remoteWebElementClass$methods(resFun)

findNamesP <- paste("findElements", findNames, sep = "")
resFun <- lapply(findNamesP, function(auxN){
  bodyTxt <- paste("{
    elements <- .self$tryExc(J(javaDriver, ", auxN,", argName))
    if( !is.null(elements) ){
      elements <- as.list(elements)
      elements <- lapply(elements, function(javaObject){
        webElemAux <- remoteWebElementClass$new(javaObject)
        return(webElemAux)
      })
      return(elements)
    }else{
      return(NULL)
    }
  }", sep = "")
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
    elements <- .self$tryExc(J(javaSelect, "getAllSelectedOptions"))
    if( !is.null( elements ) ){
      elements <- as.list(elements)
      elements <- lapply(elements, function(javaObject){
        webElemAux <- remoteWebElementClass$new(javaObject)
        return(webElemAux)
      })
      return(elements)  
    }else{
      return(NULL)
    }
  }else{
    return(invisible())  
  }
})

remoteWebElementClass$methods(getAttribute = function(stringName){
  return(.self$tryExc(J(javaWebElement, "getAttribute", stringName)))
})

remoteWebElementClass$methods(getCssValue = function(stringName){
  return(.self$tryExc(J(javaWebElement, "getCssValue", stringName)))
})

remoteWebElementClass$methods(getFirstSelectedOption = function(){
  if( !is.null( javaSelect) ){
    element <- .self$tryExc(J(javaSelect, "getFirstSelectedOption"))
    if( !is.null( element ) ){
      element <- remoteWebElementClass$new((element))
      return(element)  
    }else{
      return(NULL)
    }
  }else{
    return(invisible())  
  }
})

remoteWebElementClass$methods(getHtml = function(){
  return(.self$getAttribute("innerHTML"))
})

remoteWebElementClass$methods(getId = function(){
  return(.self$tryExc(J(javaWebElement, "getId")))
})

remoteWebElementClass$methods(getOptions = function(){
  if( !is.null( javaSelect) ){
    .self$tryExc(J(javaSelect, "getOptions"))
  }
  return(invisible())
})


remoteWebElementClass$methods(getSize = function(){
  return(.self$tryExc(J(javaWebElement, "getSize")))
})

remoteWebElementClass$methods(getTagName = function(){
  return(.self$tryExc(J(javaWebElement, "getTagName")))
})

remoteWebElementClass$methods(getText = function(){
  return(.self$tryExc(J(javaWebElement, "getText")))
})

remoteWebElementClass$methods(isDisplayed = function(){
  return(.self$tryExc(J(javaWebElement, "isDisplayed")))
})

remoteWebElementClass$methods(isEnabled = function(){
  return(.self$tryExc(J(javaWebElement, "isEnabled")))
})

remoteWebElementClass$methods(isMultiple = function(){
  if( !is.null( javaSelect) ){
    return(.self$tryExc(J(javaSelect, "isMultiple")))
  }
  return(invisible())
})


remoteWebElementClass$methods(isSelected = function(){
  return(.self$tryExc(J(javaWebElement, "isSelected")))
})

remoteWebElementClass$methods(selectByIndex = function(ind){
  if( !is.null( javaSelect) ){
    .self$tryExc(J(javaSelect, "selectByIndex", ind))
  }
  return(invisible())
})

remoteWebElementClass$methods(selectByValue = function(characterName){
  if( !is.null( javaSelect) ){
    .self$tryExc(J(javaSelect, "selectByValue", characterName))
  }
  return(invisible())
})

remoteWebElementClass$methods(selectByVisibleText = function(characterName){
  if( !is.null( javaSelect) ){
    .self$tryExc(J(javaSelect, "selectByVisibleText", characterName))
  }
  return(invisible())
})

remoteWebElementClass$methods(sendKeys = function(text = NULL, keys = NULL){
  
  if ( is.null(keys) ){
    textSearch <- .jarray( text )
    .self$tryExc(J(javaWebElement, "sendKeys", textSearch))
  }else{
    .self$tryExc(J(javaWebElement, "sendKeys", javaKeys$keysArray[[keys]]))
  }
  
  return(invisible())
})

remoteWebElementClass$methods(show = function(){
  print("Web element. Object from class remoteWebElement.")
  
})

remoteWebElementClass$methods(submit = function(){
  .self$tryExc(J(javaWebElement, "submit"))
  return(invisible())
})


.DollarNames.remoteWebElementClass <- function(x, pattern){

  auxMeth <- c(exceptionClass$methods(), "initialize", "show#envRefClass", "initialize#exceptionClass")
  objMeth <- getRefClass(class(x))$methods()
  if( is.null(x$javaSelect) ){
    javaSelectMethods <- c("isMultiple", "getOptions", "deselectAll",
                           "getAllSelectedOptions", "getFirstSelectedOption",
                           "selectByVisibleText", "selectByIndex", 
                           "selectByValue", "deselectByValue", 
                           "deselectByIndex", "deselectByVisibleText")
    auxMeth <- c(auxMeth, javaSelectMethods)
  }
  
  ind <- sapply(objMeth, function(obj){
    !(obj %in% auxMeth)
  })
  methodNames <- c(objMeth[ind], "keys")
  
  grep(pattern, methodNames, value=TRUE)
}