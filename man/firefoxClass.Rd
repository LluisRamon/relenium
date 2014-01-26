\name{firefoxClass}
\docType{class}

\alias{firefoxClass}

\title{Class \code{firefoxClass}. A class to represent Firefox web browser}
\description{
  This class is designed to represent and interact with a Firefox web browser.
}
\details{
  The firefox class is implemented as a reference class
  (see \code{\link{ReferenceClasses}} for more details). This class is designed to represent and to interact with a Firefox web browser.
 
You can open a new Firefox web browser with \code{firefoxClass$new()}, navigate to any web page, extract web data and find web elements by different ways like tag name, text, id, xpath and others.

  All methods implemented are explained below. Documentation is based on the original Selinum's Java documentation. It is possible to access to the methods through TAB completion.

Normally Firefox's binary is assumed to be in your system's default location:

\itemize{
  \item Linux \emph{firefox (found using "which")}
  \item Mac \emph{/Applications/Firefox.app/Contents/MacOS/firefox-bin}
  \item Windows \emph{\%PROGRAMFILES\%\\Mozilla Firefox\\firefox.exe}
} 

A simple \code{firefoxClass} example can be found at the end of this file. You can get a more sofisticated one using \code{demo(package = "relenium")}.


}

\section{Methods}{

  \subsection{Navigation and web data extraction}{

      \describe{

           \item{\code{get(url = "")}:}{Use this method to load a new web page in the current browser window.}
           \item{\code{getTitle()}:}{Use this method to get the title of the current page, with leading and trailing whitespace stripped, or null if one is not already set.}
           \item{\code{getCurrentUrl()}:}{Use this method to get a string representing the current URL that the browser is looking at.}
           \item{\code{getPageSource()}:}{Use this method to get the source of the last loaded page.}
           \item{\code{printHtml()}:}{Use this method to parse and print the html code of the last loaded page. It is similar to getPageSource but it returns the html code in a more readable form.}
           \item{\code{forward()}:}{Use this method to move forward a single "item" in the browser's history. It does nothing if it is on the last page viewed.}
           \item{\code{back()}:}{Use this method to move back a single "item" in the browser's history.}
           \item{\code{close()}:}{Use this method to close the Firefox browser.} 

      }
      % Thre documentation links
      % http://selenium.googlecode.com/svn/trunk/docs/api/java/org/openqa/selenium/WebDriver.html#getPageSource%28%29
      % http://selenium.googlecode.com/svn/trunk/docs/api/java/org/openqa/selenium/WebDriver.Navigation.html
      % http://selenium.googlecode.com/svn/trunk/docs/api/java/org/openqa/selenium/remote/RemoteWebDriver.html

  }

  \subsection{Locating elements}{
 
    There are different methods to find a single element in a page. All the functions from the 'findElement/s' family have the same argument stringName = "". Functions of type 'finElement' return a \code{\link{webElementClass}} object. Functions of type 'finElements' return a list of \code{\link{webElementClass}} objects. 
    % Java Doc http://selenium.googlecode.com/svn/trunk/docs/api/java/org/openqa/selenium/By.html
  
    \describe{
  
     \item{\code{findElementByXPath}:}{Use this method when you know the \emph{xpath} of an element. With this strategy, the first element matching the \emph{xpath} will be returned.}
     \item{\code{findElementByClassName}:}{Use this method when you know the \emph{class} attribute of an element. With this strategy, the first element with the \emph{class} attribute value matching the location will be returned.}
     \item{\code{findElementByCssSelector}:}{Use this method to find elements via driver's underlying W3 Selector engine. If the browser does not implement the Selector API, a best effort is made to emulate the API.}
     \item{\code{findElementById}:}{Use this method when you know the \emph{id} attribute of an element. With this strategy, the first element with the \emph{id} attribute value matching the location will be returned.}
     \item{\code{findElementByName}:}{Use this method when you know the \emph{name} attribute of an element. With this strategy, the first element with the \emph{name} attribute value matching the location will be returned.}
     \item{\code{findElementByLinkText}:}{Use this method when you know the \emph{text} of an element. With this strategy, the first element matching the \emph{exact text} will be returned.}   
     \item{\code{findElementByPartialLinkText}:}{Use this method when you know the \emph{text} of an element. With this strategy, the first element matching the \emph{partial text} will be returned.}
     \item{\code{findElementByTagName}:}{Use this method when you know the \emph{tag name} of an element. With this strategy, the first element matching the \emph{tag name} will be returned.}
  
  }}
      To find multiple elements use the following methods in the same way as the previous ones. Note that these methods will return a list.
  
    \itemize{
    
         \item \code{findElementsByXPath}
         \item \code{findElementsByClassName}
         \item \code{findElementsByCssSelector}
         \item \code{findElementsById}
         \item \code{findElementByPartialLinkText}
         \item \code{findElementsByLinkText}
         \item \code{findElementsByName}
         \item \code{findElementsByPartialLinkText}
         \item \code{findElementsByTagName}
    }


}

\examples{
  \dontrun{
    require(relenium)

    firefox <- firefoxClass$new()
    firefox$get("https://github.com/LluisRamon/relenium")
    firefox$getTitle()
    firefox$close()
  }
}

\seealso{
  \code{\link{ReferenceClasses}}, \code{\link{relenium-package}}, \code{\link{webElementClass}}
}


