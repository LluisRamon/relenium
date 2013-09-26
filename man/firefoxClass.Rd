\name{firefoxClass}
\docType{class}

\alias{firefox}
\alias{firefoxClass}

\alias{initialize, firefoxClass-method}
\alias{close, firefoxClass-method}
\alias{forward, firefoxClass-method}
\alias{back, firefoxClass-method}

\alias{get, firefoxClass-method}
\alias{getTitle, firefoxClass-method}
\alias{getCurrentUrl, firefoxClass-method}
\alias{getPageSource, firefoxClass-method}

\alias{findElementByXPath, firefoxClass-method}
\alias{findElementsByXPath, firefoxClass-method}
\alias{findElementByClassName, firefoxClass-method}
\alias{findElementByName, firefoxClass-method}
\alias{findElementByCssSelector, firefoxClass-method}
\alias{findElementById, firefoxClass-method}
\alias{findElementByLinkText, firefoxClass-method}
\alias{findElementByPartialLinkText, firefoxClass-method}
\alias{findElementByTagName, firefoxClass-method}
\alias{findElementsByClassName, firefoxClass-method}
\alias{findElementsByCssSelector, firefoxClass-method}
\alias{findElementsById, firefoxClass-method}
\alias{findElementsByLinkText, firefoxClass-method}
\alias{findElementsByName, firefoxClass-method}
\alias{findElementsByPartialLinkText, firefoxClass-method}
\alias{findElementsByTagName, firefoxClass-method}


\title{Class "firefoxClass". A class to represent firefox web browser}
\description{
  This class is designed to represent a firefox web browser.
}
\details{
  The firefox class is implemented as a reference class
  (see \code{\link{setRefClass}} for more details).
}

\section{Fields}{
  \describe{
     \item{\code{javaDriver}:}{TODO}
     \item{\code{javaNavigate}:}{TODO}
     \item{\code{methodNames}:}{TODO}
  }
}

\section{Methods}{
  \describe{
  
     \item{\code{initialize}:}{TODO}
     \item{\code{close}:}{TODO}
     \item{\code{forward}:}{TODO}
     \item{\code{back}:}{TODO}
     \item{\code{get}:}{TODO}
     \item{\code{getTitle}:}{TODO}
     \item{\code{getCurrentUrl}:}{TODO}
     \item{\code{getPageSource}:}{TODO}
     \item{\code{findElementByXPath}:}{TODO}
     \item{\code{findElementsByXPath}:}{TODO}
     \item{\code{findElementByClassName}:}{TODO}
     \item{\code{findElementByCssSelector}:}{TODO}
     \item{\code{findElementById}:}{TODO}
     \item{\code{findElementByLinkText}:}{TODO}
     \item{\code{findElementByName}:}{TODO}
     \item{\code{findElementByPartialLinkText}:}{TODO}
     \item{\code{findElementByTagName}:}{TODO}
     \item{\code{findElementsByClassName}:}{TODO}
     \item{\code{findElementsByCssSelector}:}{TODO}
     \item{\code{findElementsById}:}{TODO}
     \item{\code{findElementByPartialLinkText}:}{TODO}
     \item{\code{findElementsByLinkText}:}{TODO}
     \item{\code{findElementsByName}:}{TODO}
     \item{\code{findElementsByPartialLinkText}:}{TODO}
     \item{\code{findElementsByTagName}:}{TODO}
  }
}

\examples{
  \dontrun{
    driver <- firefox$new()
    driver$get("https://github.com/LluisRamon/seleniumJars")
    driver$getTitle()
    driver$close()
  }
}
\author{
  Aleix Ruiz de Villa, Andreu Vall, Lluis Ramon
}


