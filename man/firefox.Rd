\name{firefox}
\alias{findElementByXPath}
\alias{findElementsByXPath}
\alias{firefox}
\alias{firefox-class}
\alias{firefox-method}
\alias{get}
\alias{getTitle}
\alias{initialize}
\title{Firefox class}
\usage{
  firefox(...)
}
\arguments{
  \item{...}{Additional argument list that might not ever
  used}
}
\value{
  open firefox
}
\description{
  This class is designed to represent a firefox navigator.
}
\details{
  The firefox class is implemented as a reference class
  (see \code{\link{setRefClass}} for more details).
}
\examples{
driver <- firefox$new()
driver$get("https://github.com/LluisRamon/seleniumJars")
driver$getTitle()
driver$close()
}
\author{
  Aleix Ruiz de Villa, Andreu Vall, Lluis Ramon
}
\seealso{
  \code{\link{webElement}}
}

