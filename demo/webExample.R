require(relenium)

firefox <- firefoxClass$new()
firefox$get("http://lluisramon.github.io/relenium/toyPageExample.html")

inputElement <- firefox$findElementByXPath("//*[@id='main_content']/div[1]/form/input")
inputElement$sendKeys("R Project")
inputElement$sendKeys(key = "ENTER")

buttonElement <- firefox$findElementByXPath("//*[@id='main_content']/a")
buttonElement$click()
# -> copy data
buttonElement <- firefox$findElementByXPath("//*[@id='myModal']/div/div/div/button")
buttonElement$click()

selectElement <- firefox$findElementByXPath("//*[@id='main_content']/select")
optsList <- selectElement$getOptions() ## returns a list of options (which are webelements)
sapply(optsList, function(optEle){
  optEle$getText()
})
selectElement$selectByValue("Mango")
selectElement$selectByValue("Nectarine")
optsSel <- selectElement$getAllSelectedOptions() ## returns a list of selected options (which are webelements)
sapply(optsSel, function(optEle){
  optEle$getText()
})
selectElement$deselectAll()


firefox$close()