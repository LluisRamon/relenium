#' firefox class
#'
#' This class is designed to represent a firefox navigator.
#' 
#' The firefox class is implemented as a reference class (see \code{\link{setRefClass}}
#' for more details). 
#'
#' @param ... Additional argument list that might not ever used
#' 
#' @aliases firefox-class
#' @aliases initialize firefox-method
#' @aliases get firefox-method
#' @aliases getTitle firefox-method
#' @aliases findElementByXPath firefox-method
#' @aliases findElementsByXPath firefox-method
#' 
#' @return open firefox 
#' 
#' @author Aleix Ruiz de Villa, Andreu Vall, Lluis Ramon
#' @seealso \code{\link{webElement}}
#' 
#' @export
#' 
#' @examples
#' 
#' driver <- firefox$new()
#' driver$get("https://github.com/LluisRamon/seleniumJars")
#' driver$getTitle()
#' driver$close()
#'  

firefoxClass <- setRefClass("firefoxClass", fields = list(javaDriver = "ANY",
                                                          javaNavigate = "ANY",
                                                          methodNames = "character"), contains ="exceptionClass")

firefoxClass$methods(initialize = function(...){
  javaDriver <<- .self$tryExc(.jnew("org.openqa.selenium.firefox.FirefoxDriver"))
  javaNavigate <<- .self$tryExc(javaDriver$navigate())
  
  # Method Names
  auxMeth <- c(exceptionClass$methods(), "initialize")
  objMeth <- getRefClass(class(.self))$methods()
  ind <- sapply(objMeth, function(obj){
    !(obj %in% auxMeth)
  })
  methodNames <<- objMeth[ind]
  
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

.DollarNames.firefoxClass <- function(x, pattern)
  grep(pattern, x$methodNames, value=TRUE)
