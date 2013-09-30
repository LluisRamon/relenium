# relenium

relenium is a third party browser driver for Selenium. The main purpose of this package is making web scraping easier and powerful.

## Development

relenium is in alpha testing. Some errors could be found and documentation is still very poor.

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

## Selenium

[Selenium] is a portable software testing framework for web applications. Some members of the [Barcelona R user group], (Aleix Ruiz de Villa, Andreu Vall and Lluis Ramon) are developing a selenium package for the R programming language. Our aim is to use it for web scraping directly from R. 

[Barcelona R user group]: http://rugbcn.wordpress.com/
[Selenium]: http://docs.seleniumhq.org/
[seleniumJars]: https://github.com/LluisRamon/seleniumJars
[rJava]: http://cran.r-project.org/web/packages/rJava/index.html
[Github]: https://github.com/LluisRamon/relenium/issues
[short reproducible example]: http://adv-r.had.co.nz/Reproducibility.html
[rtools]: http://cran.r-project.org/bin/windows/Rtools/