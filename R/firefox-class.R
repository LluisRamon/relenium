firefoxClass <- setRefClass("firefoxClass", fields = list(javaDriver = "ANY",
                                                          javaNavigate = "ANY"),
                            contains ="exceptionClass")

firefoxClass$methods(initialize = function(...){
  javaDriver <<- .self$tryExc(.jnew("org.openqa.selenium.firefox.FirefoxDriver"))
  javaNavigate <<- .self$tryExc(javaDriver$navigate())
  
  callSuper(...)
})

firefoxClass$methods(back = function(){
  .self$tryExc(javaNavigate$back())
  return(invisible())
})

firefoxClass$methods(close = function(){
  .self$tryExc(J(javaDriver, "close"))
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
firefoxClass$methods(resFun)

findNamesP <- paste("findElements", findNames, sep = "")
resFun <- lapply(findNamesP, function(auxN){
  bodyTxt <- paste("{
    elements <- .self$tryExc(J(javaDriver, ", auxN, ", argName))
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
  }", sep = "")
  auxFun <- function(argName){print(3)}
  body(auxFun) <- {parse(text = bodyTxt)}
  return(auxFun)
})
names(resFun) <- findNamesP
firefoxClass$methods(resFun)

rm(findNames)
rm(findNamesS)
rm(findNamesP)
rm(resFun)

firefoxClass$methods(forward = function(){
  .self$tryExc(javaNavigate$forward())
  return(invisible())
})

firefoxClass$methods(get = function(url){
  .self$tryExc(J(javaDriver, "get", url))
  return(invisible())
})

firefoxClass$methods(getTitle = function(){
  return(.self$tryExc(J(javaDriver, "getTitle")))
})

firefoxClass$methods(getCurrentUrl = function(){
  return(.self$tryExc(J(javaDriver, "getCurrentUrl")))
})

firefoxClass$methods(getPageSource = function(){
  return(.self$tryExc(J(javaDriver, "getPageSource")))
})

firefoxClass$methods(refresh = function(){
  .self$tryExc(javaNavigate$refresh())
  return(invisible())
})

firefoxClass$methods(show = function(){
  print("Firefox web driver. Object from class firefoxClass.")
  print("Current page:")
  print(.self$getCurrentUrl())
  print("Page title:")
  print(.self$getTitle())
  
  return()
})

firefoxClass$methods(printHtml = function(){
  
  print(htmlParse(.self$getPageSource()))
  
  return()
})


.DollarNames.firefoxClass <- function(x, pattern){

  auxMeth <- c(exceptionClass$methods(), "initialize", "show#envRefClass", "initialize#exceptionClass")
  objMeth <- getRefClass(class(x))$methods()
  ind <- sapply(objMeth, function(obj){
    !(obj %in% auxMeth)
  })
  methodNames <- objMeth[ind]

  grep(pattern, methodNames, value=TRUE)
}