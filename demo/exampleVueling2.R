library(seleniumJars)

firefox <- firefoxClass$new()
firefox$get("http://www.vueling.com/")

remoteWebElement <- firefox$findElementByXPath("//*[@id='AvailabilitySearchInputXmlSearchView_DropDownListPassengerType_ADT']")


## Origen
remoteWebElement <- firefox$findElementByXPath("//*[@id='AvailabilitySearchInputXmlSearchView_TextBoxMarketOrigin1']")
remoteWebElement$sendKeys("")
for( i in 1:9 ){
  remoteWebElement$sendKeys(keys = "ARROW_DOWN")  
}
remoteWebElement$sendKeys(keys = "ENTER")  


## Desti
remoteWebElement <- firefox$findElementByXPath("//*[@id='AvailabilitySearchInputXmlSearchView_TextBoxMarketDestination1']")
remoteWebElement$sendKeys("PMI")
remoteWebElement$sendKeys(keys = "ENTER")


remoteWebElement <- firefox$findElementByXPath("//*[@id='AvailabilitySearchInputXmlSearchView_LinkButtonNewSearch']")
remoteWebElement$sendKeys(keys = "ENTER")

firefox$close()