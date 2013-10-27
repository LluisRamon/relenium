library(seleniumJars)

firefox <- firefoxClass$new()
firefox$get("http://www.vueling.com/")

#webElement <- firefox$findElementByXPath("//*[@id='AvailabilitySearchInputXmlSearchView_DropDownListPassengerType_ADT']")


## Origin
webElement <- firefox$findElementByXPath("//*[@id='AvailabilitySearchInputXmlSearchView_TextBoxMarketOrigin1']")
webElement$sendKeys("")
for( i in 1:9 ){
  webElement$sendKeys(keys = "ARROW_DOWN")  
}
webElement$sendKeys(keys = "ENTER")  


## Destination
webElement <- firefox$findElementByXPath("//*[@id='AvailabilitySearchInputXmlSearchView_TextBoxMarketDestination1']")
webElement$sendKeys("PMI")
webElement$sendKeys(keys = "ENTER")

## Press the button for the results
webElement <- firefox$findElementByXPath("//*[@id='AvailabilitySearchInputXmlSearchView_LinkButtonNewSearch']")
webElement$sendKeys(keys = "ENTER")

firefox$close()