library(seleniumJars)

firefox <- firefoxClass$new()
firefox$get("http://rugbcn.wordpress.com/")

remoteWebElement <- firefox$findElementByXPath("//*[@id='s']")
remoteWebElement$sendKeys("LLuis Ramon")
remoteWebElement$sendKeys(keys = "ENTER")

firefox$back()
firefox$forward()
firefox$refresh()