\docType{package}
\name{relenium}
\alias{relenium-package}
\title{Relenium: Selenium for R}

\description{
    Selenium is a popular suite of tools specifically for automating web browsers. Selenium allows users to write tests in a number of popular programming languages including Java. The relenium package is intended to provide access to Selenium and use it to boost web navigation and to ease the path for web scraping in R.
}

\section{Relenium classes}{
 
   The relenium package is implemented with \code{Reference Classes}  (see \code{\link{setRefClass}} for more details). There are two classes: \code{\link{firefoxClass}} and \code{\link{remoteWebElementClass}}. The first one, represents a Firefox web browser and the second one an HTML element. There are methods in each class to navigate, select, find elements and to extract data.

}

\section{Bugs and new features}{

To report technical problems with relenium, please file an issue on \href{https://github.com/LluisRamon/relenium/issues}{Github} with a \href{http://adv-r.had.co.nz/Reproducibility.html}{short reproducible example}. Feedback is welcomed and any new features should be filed as issues as well.

}