require(relenium)

firefox <- firefoxClass$new()
firefox$get("http://lluisramon.github.io/relenium/toyPageExample.html")

inputElement <- firefox$findElementByXPath("//*[@id='main_content']/div[1]/form/input")
inputElement$sendKeys("R Project")
inputElement$sendKeys(key = "ENTER")

buttonElement <- firefox$findElementByXPath("//*[@id='main_content']/a")
buttonElement$click()

firefox$close()