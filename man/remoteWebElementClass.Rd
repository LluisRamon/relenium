\name{remoteWebElementClass}
\docType{class}

\alias{remoteWebElement}
\alias{remoteWebElementClass}

\alias{clear, remoteWebElementClass-method} 
\alias{click, remoteWebElementClass-method} 
\alias{deselectAll, remoteWebElementClass-method} 
\alias{deselectByIndex, remoteWebElementClass-method} 
\alias{deselectByValue, remoteWebElementClass-method} 
\alias{deselectByVisibleText, remoteWebElementClass-method} 
\alias{findElementByClassName, remoteWebElementClass-method} 
\alias{findElementByCssSelector, remoteWebElementClass-method} 
\alias{findElementById, remoteWebElementClass-method} 
\alias{findElementByLinkText, remoteWebElementClass-method} 
\alias{findElementByName, remoteWebElementClass-method} 
\alias{findElementByPartialLinkText, remoteWebElementClass-method} 
\alias{findElementByTagName, remoteWebElementClass-method} 
\alias{findElementByXPath, remoteWebElementClass-method} 
\alias{findElementsByClassName, remoteWebElementClass-method} 
\alias{findElementsByCssSelector, remoteWebElementClass-method} 
\alias{findElementsById, remoteWebElementClass-method} 
\alias{findElementsByLinkText, remoteWebElementClass-method} 
\alias{findElementsByName, remoteWebElementClass-method} 
\alias{findElementsByPartialLinkText, remoteWebElementClass-method} 
\alias{findElementsByTagName, remoteWebElementClass-method} 
\alias{findElementsByXPath, remoteWebElementClass-method} 
\alias{getAllSelectedOptions, remoteWebElementClass-method} 
\alias{getAttribute, remoteWebElementClass-method} 
\alias{getCssValue, remoteWebElementClass-method} 
\alias{getFirstSelectedOption, remoteWebElementClass-method} 
\alias{getHtml, remoteWebElementClass-method} 
\alias{getId, remoteWebElementClass-method} 
\alias{getOptions, remoteWebElementClass-method} 
\alias{getSize, remoteWebElementClass-method} 
\alias{getTagName, remoteWebElementClass-method} 
\alias{getText, remoteWebElementClass-method} 
\alias{initialize, remoteWebElementClass-method} 
\alias{isDisplayed, remoteWebElementClass-method} 
\alias{isEnabled, remoteWebElementClass-method} 
\alias{isMultiple, remoteWebElementClass-method} 
\alias{isSelected, remoteWebElementClass-method} 
\alias{selectByIndex, remoteWebElementClass-method} 
\alias{selectByValue, remoteWebElementClass-method} 
\alias{selectByVisibleText, remoteWebElementClass-method} 
\alias{sendKeys, remoteWebElementClass-method} 
\alias{submit, remoteWebElementClass-method} 
\alias{keys, remoteWebElementClass-method} 
\alias{isMultiple, remoteWebElementClass-method} 
\alias{getOptions, remoteWebElementClass-method} 
\alias{deselectAll, remoteWebElementClass-method} 
\alias{getAllSelectedOptions, remoteWebElementClass-method} 
\alias{getFirstSelectedOption, remoteWebElementClass-method} 
\alias{selectByVisibleText, remoteWebElementClass-method} 
\alias{selectByIndex, remoteWebElementClass-method} 
\alias{selectByValue, remoteWebElementClass-method} 
\alias{deselectByValue, remoteWebElementClass-method} 
\alias{deselectByIndex, remoteWebElementClass-method} 
\alias{deselectByVisibleText, remoteWebElementClass-method} 

\title{Class "remoteWebElementClass". A class to represent a remote web element}
\description{
  This class is designed to represent a remote web element.
}
\details{
  The remoteWebElement class is implemented as a reference class
  (see \code{\link{setRefClass}} for more details).
}

\section{Methods}{
  \describe{
  
     \item{\code{clear}:}{TODO} 
     \item{\code{click}:}{TODO} 
     \item{\code{deselectAll}:}{TODO} 
     \item{\code{deselectByIndex}:}{TODO} 
     \item{\code{deselectByValue}:}{TODO} 
     \item{\code{deselectByVisibleText}:}{TODO} 
     \item{\code{getAllSelectedOptions}:}{TODO} 
     \item{\code{getAttribute}:}{TODO} 
     \item{\code{getCssValue}:}{TODO} 
     \item{\code{getFirstSelectedOption}:}{TODO} 
     \item{\code{getHtml}:}{TODO} 
     \item{\code{getId}:}{TODO} 
     \item{\code{getOptions}:}{TODO} 
     \item{\code{getSize}:}{TODO} 
     \item{\code{getTagName}:}{TODO} 
     \item{\code{getText}:}{TODO} 
     \item{\code{initialize}:}{TODO} 
     \item{\code{isDisplayed}:}{TODO} 
     \item{\code{isEnabled}:}{TODO} 
     \item{\code{isMultiple}:}{TODO} 
     \item{\code{isSelected}:}{TODO} 
     \item{\code{selectByIndex}:}{TODO} 
     \item{\code{selectByValue}:}{TODO} 
     \item{\code{selectByVisibleText}:}{TODO} 
     \item{\code{sendKeys}:}{TODO} 
     \item{\code{submit}:}{TODO} 
     \item{\code{keys}:}{TODO} 
     \item{\code{isMultiple}:}{TODO} 
     \item{\code{getOptions}:}{TODO} 
     \item{\code{deselectAll}:}{TODO} 
     \item{\code{getAllSelectedOptions}:}{TODO} 
     \item{\code{getFirstSelectedOption}:}{TODO} 
     \item{\code{selectByVisibleText}:}{TODO} 
     \item{\code{selectByIndex}:}{TODO} 
     \item{\code{selectByValue}:}{TODO} 
     \item{\code{deselectByValue}:}{TODO} 
     \item{\code{deselectByIndex}:}{TODO} 
     \item{\code{deselectByVisibleText}:}{TODO} 
     
  }
  
    \subsection{Locating elements}{
  
    There are diferent methods to find a single element in a page:
    % Java Doc http://selenium.googlecode.com/svn/trunk/docs/api/java/org/openqa/selenium/By.html
   
    \describe{
   
     \item{\code{findElementByXPath}:}{Use this method when you know the \emph{xpath} of an element. With this strategy, the first element matching the \emph{xpath} will be returned.}
     \item{\code{findElementByClassName}:}{Use this method when you know \emph{class} attribute of an element. With this strategy, the first element with the \emph{class} attribute value matching the location will be returned.}
     \item{\code{findElementByCssSelector}:}{TODO (the driver's underlying W3 Selector engine)}
     \item{\code{findElementById}:}{Use this method when you know \emph{id} attribute of an element. With this strategy, the first element with the \emph{id} attribute value matching the location will be returned.}
     \item{\code{findElementByName}:}{Use this method when you know the \emph{name} attribute of an element. With this strategy, the first element with the \emph{name} attribute value matching the location will be returned.}
     \item{\code{findElementByLinkText}:}{Use this method when you know \emph{text} of an element. With this strategy, the first element matching the \emph{exact text} will be returned.}    
     \item{\code{findElementByPartialLinkText}:}{Use this method when you know \emph{text} of an element. With this strategy, the first element matching the \emph{partial text} will be returned.}
     \item{\code{findElementByTagName}:}{Use this method when you know the \emph{tag name} of an element. With this strategy, the first element matching the \emph{tag name} will be returned.}
   
  }
  
  To find multiple elements use the following methods in the same way as the previous ones. Note that these methods will return a list.
   
    \itemize{
         \item{findElementsByXPath}
         \item{findElementsByClassName}
         \item{findElementsByCssSelector}
         \item{findElementsById}
         \item{findElementByPartialLinkText}
         \item{findElementsByLinkText}
         \item{findElementsByName}
         \item{findElementsByPartialLinkText}
         \item{findElementsByTagName}
    }
    }
 
}

\author{
  Aleix Ruiz de Villa, Andreu Vall, Lluis Ramon
}
\seealso{
  \code{\link{firefoxClass}}
}

