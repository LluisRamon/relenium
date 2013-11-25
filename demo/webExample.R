#require(relenium)
require(XML)

firefox <- firefoxClass$new()
firefox$get("http://lluisramon.github.io/relenium/toyPageExample.html")

firefox$printHtml()

inputElement <- firefox$findElementByXPath("//*[@id='main_content']/div[1]/form/input")
inputElement$sendKeys("R Project")
inputElement$sendKeys(key = "ENTER")

buttonElement <- firefox$findElementByXPath("//*[@id='main_content']/a")
buttonElement$click()

infoTable <- firefox$findElementByXPath("//*[@id='myModal']/div/div/div/table")
readHTMLTable(infoTable$getHtml(), header = TRUE)[[1]] # Using XML Package

buttonElement <- firefox$findElementByXPath("//*[@id='myModal']/div/div/div/button")
buttonElement$click()

selectElement <- firefox$findElementByXPath("//*[@id='main_content']/select")

selectElement$printHtml()

optsList <- selectElement$getOptions()
sapply(optsList, function(optEle){
  optEle$getText()
})


selectElement$selectByValue("Mango")
selectElement$selectByValue("Nectarine")
optsSel <- selectElement$getAllSelectedOptions()
sapply(optsSel, function(optEle){
  optEle$getText()
})
selectElement$deselectAll()

firefox$get("http://lluisramon.github.io/relenium/")
firefox$back()
firefox$close()
