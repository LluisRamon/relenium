javaKeysClass <- setRefClass("javaKeysClass", fields = list(keysArray = "list",
                                                            keysNames = "character",
                                                            keysOriginal = "jclassName"
                                                            )
                             )

javaKeysClass$methods(initialize = function(){
  keysOriginal <<- J("org.openqa.selenium.Keys")
  keysAux <- as.list(J(keysOriginal, "values"))
  keysNames <<- sapply(keysAux, function(ele){
    J(ele, "name")
  })
  keysArray <<- sapply(keysNames, function(keyName){
    .jarray(J(keysOriginal, "valueOf", keyName), "java/lang/CharSequence")
  })
  
  callSuper()
})
