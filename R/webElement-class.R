webElementClass <- setRefClass("webElementClass", fields = list(javaKeys = "javaKeysClass", 
                                                                javaWebElement = "ANY",
                                                                javaSelect = "ANY",
                                                                keys = "character"), 
                                     contains = "exceptionClass")

webElementClass$methods(initialize = function(javaObj, ...){
  javaWebElement <<- javaObj
  javaKeys <<- javaKeysClass$new()
  keys <<- javaKeys$keysNames

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

webElementClass$methods(clear = function(){
  .self$tryExc(J(javaWebElement, "clear"))
  return(invisible())
})

webElementClass$methods(click = function(){
  .self$tryExc(J(javaWebElement, "click"))
  return(invisible())
})

webElementClass$methods(deselectAll = function(){
  if( !is.null( javaSelect) ){
    .self$tryExc(J(javaSelect, "deselectAll"))
  }
  return(invisible())
})

webElementClass$methods(deselectByIndex = function(ind = 1){
  if( !is.null( javaSelect) ){
    .self$tryExc(J(javaSelect, "deselectByIndex", ind))
  }
  return(invisible())
})

webElementClass$methods(deselectByValue = function(stringName = ""){
  if( !is.null( javaSelect) ){
    .self$tryExc(J(javaSelect, "deselectByValue", stringName))
  }
  return(invisible())
})

webElementClass$methods(deselectByVisibleText = function(stringName = ""){
  if( !is.null( javaSelect) ){
    .self$tryExc(J(javaSelect, "deselectByVisibleText", stringName))
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
    webElement <- .self$tryExc(J(javaWebElement, '", auxN, "', stringName))
    if( !is.null(webElement) ){
      webElement <- webElementClass$new(webElement)
      return(webElement)
    }else{
      return(NULL)
    }
  }", sep = "")
  auxFun <- function(stringName = ""){print(3)}
  body(auxFun) <- {parse(text = bodyTxt)}
  return(auxFun)
  })
names(resFun) <- findNamesS
webElementClass$methods(resFun)

findNamesP <- paste("findElements", findNames, sep = "")
resFun <- lapply(findNamesP, function(auxN){
  bodyTxt <- paste("{
    elements <- .self$tryExc(J(javaWebElement, '", auxN,"', stringName))
    if( !is.null(elements) ){
      elements <- as.list(elements)
      elements <- lapply(elements, function(javaObject){
        webElemAux <- webElementClass$new(javaObject)
        return(webElemAux)
      })
      return(elements)
    }else{
      return(NULL)
    }
  }", sep = "")
  auxFun <- function(stringName = ""){print(3)}
  body(auxFun) <- {parse(text = bodyTxt)}
  return(auxFun)
})
names(resFun) <- findNamesP
webElementClass$methods(resFun)

rm(findNames)
rm(findNamesS)
rm(findNamesP)
rm(resFun)


webElementClass$methods(getAllSelectedOptions = function(){
  if( !is.null( javaSelect) ){
    elements <- .self$tryExc(J(javaSelect, "getAllSelectedOptions"))
    if( !is.null( elements ) ){
      elements <- as.list(elements)
      elements <- lapply(elements, function(javaObject){
        webElemAux <- webElementClass$new(javaObject)
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

webElementClass$methods(getAllAttributes = function(){
  htmlTxt <- .self$getHtml()
  treeTxt <- htmlTreeParse(htmlTxt)
  xmlAttrs(treeTxt[[1]][[1]][[1]])
})

webElementClass$methods(getAttribute = function(stringName = ""){
  return(.self$tryExc(J(javaWebElement, "getAttribute", stringName)))
})

webElementClass$methods(getCssValue = function(stringName = ""){
  return(.self$tryExc(J(javaWebElement, "getCssValue", stringName)))
})

webElementClass$methods(getFirstSelectedOption = function(){
  if( !is.null( javaSelect) ){
    element <- .self$tryExc(J(javaSelect, "getFirstSelectedOption"))
    if( !is.null( element ) ){
      element <- webElementClass$new((element))
      return(element)  
    }else{
      return(NULL)
    }
  }else{
    return(invisible())  
  }
})

webElementClass$methods(getHtml = function(tagLine = TRUE){
  if( tagLine ){
    return(.self$getAttribute("outerHTML"))
  }else{
    return(.self$getAttribute("innerHTML"))    
  }
})

webElementClass$methods(getId = function(){
  return(.self$tryExc(J(javaWebElement, "getId")))
})

webElementClass$methods(getOptions = function(){
  if( !is.null( javaSelect) ){
    elements <- .self$tryExc(J(javaSelect, "getOptions"))
    if( !is.null( elements ) ){
      elements <- as.list(elements)
      elements <- lapply(elements, function(javaObject){
        webElemAux <- webElementClass$new(javaObject)
        return(webElemAux)
      })
      return(elements)  
    }else{
      print("No options returned")
      return(NULL)
    }
  } 
  return(NULL)
})


webElementClass$methods(getSize = function(){
  objSize <- .self$tryExc(J(javaWebElement, "getSize"))
  objHeight <- J(objSize, "getHeight")
  objWidth <- J(objSize, "getWidth")

  return(c(objHeight, objWidth))
})

webElementClass$methods(getTagName = function(){
  return(.self$tryExc(J(javaWebElement, "getTagName")))
})

webElementClass$methods(getText = function(){
  return(.self$tryExc(J(javaWebElement, "getText")))
})

webElementClass$methods(isDisplayed = function(){
  return(.self$tryExc(J(javaWebElement, "isDisplayed")))
})

webElementClass$methods(isEnabled = function(){
  return(.self$tryExc(J(javaWebElement, "isEnabled")))
})

webElementClass$methods(isMultiple = function(){
  if( !is.null( javaSelect) ){
    return(.self$tryExc(J(javaSelect, "isMultiple")))
  }
  return(invisible())
})


webElementClass$methods(isSelected = function(){
  return(.self$tryExc(J(javaWebElement, "isSelected")))
})

webElementClass$methods(selectByIndex = function(ind = 1){
  if( !is.null( javaSelect) ){
    .self$tryExc(J(javaSelect, "selectByIndex", ind))
  }
  return(invisible())
})

webElementClass$methods(selectByValue = function(stringName = ""){
  if( !is.null( javaSelect) ){
    .self$tryExc(J(javaSelect, "selectByValue", stringName))
  }
  return(invisible())
})

webElementClass$methods(selectByVisibleText = function(stringName = ""){
  if( !is.null( javaSelect) ){
    .self$tryExc(J(javaSelect, "selectByVisibleText", stringName))
  }
  return(invisible())
})

webElementClass$methods(sendKeys = function(text = NULL, keys = NULL){
  
  if ( is.null(keys) ){
    textSearch <- .jarray( text )
    .self$tryExc(J(javaWebElement, "sendKeys", textSearch))
  }else{
    .self$tryExc(J(javaWebElement, "sendKeys", javaKeys$keysArray[[keys]]))
  }
  
  return(invisible())
})

webElementClass$methods(show = function(){
  tagName <- .self$getTagName()
  print(paste("Object from class webElement. Tag:", tagName, ". Attributes:"))
  print(.self$getAllAttributes())
  
})

webElementClass$methods(submit = function(){
  .self$tryExc(J(javaWebElement, "submit"))
  return(invisible())
})

webElementClass$methods(printHtml = function(tagLine = TRUE){
  
  print(htmlParse(.self$getHtml(tagLine)))
  
  return()
})

.DollarNames.webElementClass <- function(x, pattern){

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