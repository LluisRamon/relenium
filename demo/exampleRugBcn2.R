library(seleniumJars)
require(devtools)
# install_github("relenium", "LluisRamon")

firefox <- firefoxClass$new()
firefox$get("http://rugbcn.wordpress.com/")

remoteWebElement <- firefox$findElementById("searchform")
remoteWebElement$keys
remoteWebElement$getHtml()

remoteWebElement <- firefox$findElementByXPath("//*[@id='s']")
remoteWebElement$sendKeys("LLuis Ramon")
remoteWebElement$sendKeys(keys = "ENTER")

firefox$back()
firefox$forward()
firefox$refresh()