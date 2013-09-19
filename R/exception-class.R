exceptionClass <- setRefClass("exceptionClass", fields = list(exceptionTable = "matrix",
                                            javaWarMes = "character"))

exceptionClass$methods(initialize=function(){
  auxData <- c("ElementNotVisibleException", "Thrown to indicate that although an element is present on the DOM, it is not visible, and so is not able to be interacted with.",
                      "ImeActivationFailedException", "Indicates that activating an IME engine has failed.",
                      "ImeNotAvailableException", "Indicates that IME support is not available.",
                      "InvalidCookieDomainException", "Thrown when attempting to add a cookie under a different domain than the current URL.",
                      "InvalidElementStateException", "",
                      "InvalidSelectorException", "",
                      "NoAlertPresentException", "Indicates that a user has tried to access an alert when one is not present.",
                      "NoSuchElementException", "Thrown by WebDriver.findElement(By by) and WebElement.findElement(By by).",
                      "NoSuchFrameException", "Thrown by WebDriver.switchTo().frame(int frameIndex) and WebDriver.switchTo().frame(String frameName).",
                      "NoSuchWindowException", "Thrown by WebDriver.switchTo().window(String windowName).",
                      "NotFoundException", "SessionNotCreatedException  Indicates that a session could not be created.",
                      "StaleElementReferenceException", "Indicates that a reference to an element is now 'stale' --- the element no longer appears on the DOM of the page.",
                      "TimeoutException", "Thrown when a command does not complete in enough time.",
                      "UnableToSetCookieException", "Thrown when a driver fails to set a cookie.",
                      "UnhandledAlertException", "",
                      "UnsupportedCommandException", "Used to indicate that a command used by the remote webdriver is unsupported.",
                      "WebDriverException", "",
                      "XPathLookupException", "")
  exceptionTable <<- matrix(ncol = 2, nrow = length(auxData)/2, data = auxData, byrow = TRUE)
  colnames(exceptionTable) <<- c("Exception Name", "Exception Description")
  
  callSuper()
})

exceptionClass$methods(tryExc = function(expr){
  res <- try(expr, silent = TRUE)
  if(class(res) == "try-error"){
    javaWarMes <<- res
    ind <- sapply(exceptionTable[, 1], function(excpName){
      grepl(excpName, javaWarMes)
    })
    if(sum(ind)>0){
      print(as.vector(exceptionTable[ind, 2]))
    }else{
      print(javaWarMes)
    }
    
    return(NULL)
  }else{
    return(res)
  }
})
