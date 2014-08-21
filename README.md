
> Dear relenium users, 

> We have noticed that other Selenium bindings have been developed and successfully contributed on CRAN ([RSelenium][]). Aleix and me (Lluís) think that it doesn't make much sense to have two Selenium bindings in the R community. As we have failed to contribute [relenium][] and [seleniumJars][] on CRAN, we encourage you to switch to RSelenium. We will be updating Selenium JARS for a while but we will no longer improve relenium or fix any issues, neither try again to contribute it on CRAN. We thank all of you for the comments, improvements and ideas that have been shared with us. We have enjoyed developing relenium and we are happy that a Selenium binding is available in the R community. RSelenium is an [rOpenSci][] package and we are sure that it will be well maintained.

[RSelenium]: https://github.com/ropensci/RSelenium
[rOpenSci]: http://ropensci.org/packages/
[relenium]: https://github.com/LluisRamon/relenium
[seleniumJars]: https://github.com/LluisRamon/seleniumJars

---



## Introduction

[Selenium][] is a popular suite of tools specifically designed for automating web browsers. Selenium allows users to write tests in a number of popular programming languages including Java. The __relenium package__ is intended to provide access to Selenium and use it to boost web navigation and to ease the path for web scraping in R.

## Development

Some members of the [Barcelona R user group] are developing relenium. Right now, relenium is in beta testing. Some errors might be found and documentation is still been improved.


## Installation

You can install `relenium` from `github` using the `devtools` package. A recent version of Java Runtime Environment (JRE) and Firefox web browser are required. [seleniumJars] and [rJava] R packages are also needed. You can get `rJava` from `CRAN` and `seleniumJars` from `github`.

```
install.packages("rJava")

require(devtools)

install_github('seleniumJars', 'LluisRamon')
install_github('relenium', 'LluisRamon')
```

In case you are using Windows you will also need [rtools][]. In case R is trying to access to the Intenet through a proxy, follow this [SO question][]. If you have trubles with the installation, it is suggested to reinstall Java, rJava and relenium. Check that all of them, including R, correspond to the same version (32 or 64 bits). 

[rtools]: http://cran.r-project.org/bin/windows/Rtools/
[SO question]: http://stackoverflow.com/questions/17783686/solution-how-to-install-github-when-there-is-a-proxy

## Bugs and new features

To report technical problems with relenium, please file an issue on [Github][] with a [short reproducible example][]. Including the ouptut of the following code will make much easier to track any problem.

```
library(relenium)

sessionInfo()

firefox <- firefoxClass$new()
firefox$getCapabilities()
firefox$getVersion()
firefox$close()
```

Feedback is welcomed and any new features should be filed as issues as well.


[Barcelona R user group]: http://rugbcn.wordpress.com/
[Selenium]: http://docs.seleniumhq.org/
[seleniumJars]: https://github.com/LluisRamon/seleniumJars
[rJava]: http://cran.r-project.org/web/packages/rJava/index.html
[Github]: https://github.com/LluisRamon/relenium/issues
[short reproducible example]: http://adv-r.had.co.nz/Reproducibility.html
[rtools]: http://cran.r-project.org/bin/windows/Rtools/