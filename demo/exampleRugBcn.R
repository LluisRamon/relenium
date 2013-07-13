library(seleniumJars)

  ## els keys son les accions generals que es pot fer amb el teclat, 
  ## tipus ENTER, etc. En java es un 'enum' (enumeració de noms)
keys <- J("org.openqa.selenium.Keys")

  ## Obro driver i carrego pagina
jDriver <- .jnew("org.openqa.selenium.firefox.FirefoxDriver")
J(jDriver, "get", "http://rugbcn.wordpress.com/")

  ## RemoteWebElement es la nom estandar per aquesta classe
  ## Busco l'element per 'buscar dintre del blog'
remoteWebElement <- J(jDriver, "findElementByXPath", "//*[@id='s']")
  ## per veure els mètodes i arguments que te
.jmethods(remoteWebElement)

  ## la funcio sendKeys serveix per escriure i clicar Enter, entre d'altres.
  ## El seu argument es un CharSequence, que ve a se un String. El tema
  ## es que nomès accepta un vector i per tant l'haig de crear amb la fucio .jarray
textSearch <- .jarray( c("Lluis Ramon") )
  ## El seguent vol dir: a l'element remoteWebElement, aplica el seu metode 
  ## "sendKeys" amb l'argument textSearch
J(remoteWebElement, "sendKeys", textSearch)

  ## tornem a crear un array. En aquest cas li hem de dir de quin tipus son 
  ## els seus elements. El JNI (no se ben be que es) necessita que els tipus
  ## s'explicitin d'aquesta manera "java/lang/String",...
  ## El metode "valueOf", retorna el valor de. 
enterSeq <- .jarray(J(keys, "valueOf", "ENTER"), "java/lang/CharSequence")
  ## amb $ podria ser: enterSeq <- .jarray(keys$ENTER, "java/lang/CharSequence")
J(remoteWebElement, "sendKeys", enterSeq)
  ## alternativament podriem fer J(remoteWebElement, "submit")

  ## Per navegar :
jNavigate <- jDriver$navigate()
jNavigate$back()
jNavigate$forward()


