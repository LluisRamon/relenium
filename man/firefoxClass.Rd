\name{firefoxClass}
\docType{class}

\alias{firefox}
\alias{firefoxClass}
\alias{findElementByXPath, firefoxClass-method}
\alias{findElementsByXPath, firefoxClass-method}
\alias{get, firefoxClass-method}
\alias{getTitle, firefoxClass-method}
\alias{initialize, firefoxClass-method}

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
     \item{\code{findElementByXPath}:}{TODO}
     \item{\code{findElementsByXPath}:}{TODO}
     \item{\code{get}:}{TODO}
     \item{\code{getTitle}:}{TODO}
     \item{\code{initialize}:}{TODO}
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


