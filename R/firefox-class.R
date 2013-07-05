#' Firefox class
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
#' @author Aleix Ruiz de Villa, Andreu Vall, Lluís Ramon
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

firefox <- setRefClass("firefox", fields = list(javaDriver = "ANY"))

firefox$methods(initialize = function(...){
  javaDriver <<- .jnew("org.openqa.selenium.firefox.FirefoxDriver")
  
  callSuper(...)
})

firefox$methods(get = function(url){
  
  javaDriver$get(url)
  
  return(invisible())
  
})

firefox$methods(getTitle = function(){
  
  title <- javaDriver$getTitle()
  
  return(title)
  
})

firefox$methods(findElementsByXPath = function(xpath){
  
  elements <- javaDriver$findElementsByXPath(xpath)
  elements <- as.list(elements)
  
  elements <- lapply(elements, function(javaObject){
    webElemAux <- webElement$new(javaObject)
    return(webElemAux)
  })
  
  return(elements)
  
})

firefox$methods(findElementByXPath = function(xpath){
  
  element <- try(javaDriver$findElementByXPath(xpath), silent = TRUE)
  
  if(class(element) == "try-error"){
    print(element)
    return(invisible())
  }
  
  return(element)
  
})

firefox$methods(close = function(){
  
  javaDriver$close()
  
  return(invisible())
  
})
