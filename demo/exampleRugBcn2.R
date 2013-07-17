library(seleniumJars)

firefox <- firefoxClass$new()
firefox$get("http://rugbcn.wordpress.com/")

remoteWebElement <- fireDriver$findElementByXPath("//*[@id='s']")
remoteWebElement$sendKeys("LLuis Ramon")
remoteWebElement$sendKeys(keys = "ENTER")
