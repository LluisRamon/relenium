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
                                                          methodNames = "character"))

firefoxClass$methods(initialize = function(...){
  javaDriver <<- .jnew("org.openqa.selenium.firefox.FirefoxDriver")
  javaNavigate <<- javaDriver$navigate()
  
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

firefoxClass$methods(back = function(){
  javaNavigate$back()
  
  return(invisible())
})

firefoxClass$methods(get = function(url){
  
  J(javaDriver, "get", url)
  
  return(invisible())
  
})

firefoxClass$methods(getTitle = function(){
  
  title <- J(javaDriver, "getTitle")
  
  return(title)
  
})

firefoxClass$methods(findElementsByXPath = function(xpath){
  
  elements <- J(javaDriver, "findElementsByXPath", xpath)
  elements <- as.list(elements)
  
  elements <- lapply(elements, function(javaObject){
    webElemAux <- remoteWebElementClass$new(javaObject)
    return(webElemAux)
  })
  
  return(elements)
  
})

firefoxClass$methods(findElementByXPath = function(xpath){
  
  webElement <- remoteWebElementClass$new(J(javaDriver, "findElementByXPath", xpath))
  
  return(webElement)
  
})

firefoxClass$methods(close = function(){
  
  J(javaDriver, "close")
  
  return(invisible())
  
})

firefoxClass$methods(getCurrentUrl = function(){
  
  currentUrl <- try(J(javaDriver, "getCurrentUrl"), silent = TRUE)
  
  if(class(currentUrl) == "try-error"){
    print(currentUrl)
    return(invisible())
  }
  
  return(currentUrl)
  
})

firefoxClass$methods(forward = function(){
  javaNavigate$forward()
  
  return(invisible())
})

firefoxClass$methods(refresh = function(){
  javaNavigate$refresh()
  
  return(invisible())
})



# firefoxClass$methods(show = function(){
#   
#   print("Html code")
#   
#   # Return with Rcurl html code. Maybe too slow. 
#   
#   return(invisible())
#   
# })

.DollarNames.firefoxClass <- function(x, pattern)
  grep(pattern, x$methodNames, value=TRUE)
