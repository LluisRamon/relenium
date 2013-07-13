library(seleniumJars)

keys <- J("org.openqa.selenium.Keys")
jDriver <- .jnew("org.openqa.selenium.firefox.FirefoxDriver")
J(jDriver, "get", "http://www.vueling.com/")

  ## Origen
webElement <- J(jDriver, "findElementByXPath", "//*[@id='AvailabilitySearchInputXmlSearchView_TextBoxMarketOrigin1']")
textSearch <- .jarray( c("") )
J(webElement, "sendKeys", textSearch)
enterSeq <- .jarray(J(keys, "valueOf", "ARROW_DOWN"), "java/lang/CharSequence")
J(webElement, "sendKeys", enterSeq)  
J(webElement, "sendKeys", enterSeq)  
J(webElement, "sendKeys", enterSeq)  
J(webElement, "sendKeys", enterSeq)  
J(webElement, "sendKeys", enterSeq)  
J(webElement, "sendKeys", enterSeq)  
J(webElement, "sendKeys", enterSeq)  
J(webElement, "sendKeys", enterSeq)  
J(webElement, "sendKeys", enterSeq)  
enterSeq <- .jarray(J(keys, "valueOf", "ENTER"), "java/lang/CharSequence")
J(webElement, "sendKeys", enterSeq)  

  ## Desti
webElement <- J(jDriver, "findElementByXPath", "//*[@id='AvailabilitySearchInputXmlSearchView_TextBoxMarketDestination1']")
enterSeq <- .jarray(c("PMI"))
J(webElement, "sendKeys", enterSeq)  
enterSeq <- .jarray(J(keys, "valueOf", "ENTER"), "java/lang/CharSequence")
J(webElement, "sendKeys", enterSeq)  

 
webElement <- J(jDriver, "findElementByXPath", "//*[@id='AvailabilitySearchInputXmlSearchView_LinkButtonNewSearch']")
enterSeq <- .jarray(J(keys, "valueOf", "ENTER"), "java/lang/CharSequence")
J(webElement, "sendKeys", enterSeq)  
