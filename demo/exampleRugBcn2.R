library(seleniumJars)
require(devtools)
# install_github("relenium", "LluisRamon")

firefox <- firefoxClass$new()
firefox$get("http://rugbcn.wordpress.com/")

webElement <- firefox$findElementById("searchform")
# keys that can be used in the sendkeys function
webElement$keys
# inner html code of the element
webElement$getHtml()

webElement <- firefox$findElementByXPath("//*[@id='s']")
webElement$sendKeys("LLuis Ramon")
webElement$sendKeys(keys = "ENTER")

firefox$back()
firefox$forward()
firefox$refresh()