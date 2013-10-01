## Introduction

[Selenium][] is a popular suite of tools specifically for automating web browsers. Selenium allows users to write tests in a number of popular programming languages including Java. The __relenium package__ is intended to provide access to Selenium and use it for easy and powerful web scraping.

## Development

Some members of the [Barcelona R user group], (Aleix Ruiz de Villa, Andreu Vall and Lluis Ramon) are developing relenium. Right now, relenium is in alpha testing. Some errors could be found and documentation is still very poor.


## Installation

You can install `relenium` from `github` using the `devtools` package. 

```
require(devtools)
install_github('relenium', 'LluisRamon')
```

[seleniumJars] and [rJava] are required. You can get rJava from CRAN and seleniumJars from github.

```
install.packages("rJava")

require(devtools)
install_github('seleniumJars', 'LluisRamon')
```

In case you are using Windows you will also need [rtools][].

[rtools]: http://cran.r-project.org/bin/windows/Rtools/

## Bugs and new features

To report technical problems with relenium, please file an issue on [Github][] with a [short reproducible example][]. Feedback is welcomed and any new features should be filed as issues as well.


[Barcelona R user group]: http://rugbcn.wordpress.com/
[Selenium]: http://docs.seleniumhq.org/
[seleniumJars]: https://github.com/LluisRamon/seleniumJars
[rJava]: http://cran.r-project.org/web/packages/rJava/index.html
[Github]: https://github.com/LluisRamon/relenium/issues
[short reproducible example]: http://adv-r.had.co.nz/Reproducibility.html
[rtools]: http://cran.r-project.org/bin/windows/Rtools/