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

\section{Fields}{
  \describe{
     \item{\code{keys}:}{This is a list of the available keys that can be used in the 'sendKeys' method. They refer to keys of the keyboard.}
  }
}

\section{Methods}{
  \describe{
  

     \item{\code{clear}:}{If this element is a text entry element, this will clear the value.} 
     \item{\code{click}:}{Click this element.} 
     \item{\code{getAttribute}:}{Get the value of a the given attribute of the element.} 
     \item{\code{getCssValue}:}{Get the value of a given CSS property.} 
     \item{\code{getHtml}:}{Get the inner html code of this element.} 
     \item{\code{getId}:}{Get the id of this element.} 
     \item{\code{getSize}:}{What is the width and height of the rendered element?} 
     \item{\code{getTagName}:}{Get the tag name of this element.} 
     \item{\code{getText}:}{Get the visible text} 
     \item{\code{isDisplayed}:}{Is this element displayed or not?} 
     \item{\code{isEnabled}:}{Is the element currently enabled or not? This will generally return true for everything but disabled input elements}
     \item{\code{isSelected}:}{Determine whether or not this element is selected or not. This operation only applies to input elements such as checkboxes, options in a select and radio buttons. It returns True if the element is currently selected or checked, false otherwise.} 
     \item{\code{sendKeys}:}{Use this method to simulate typing into an element, which may set its value.} 
     \item{\code{submit}:}{If this current element is a form, or an element within a form, then this will be submitted to the remote server.} 

     
  }
  
    \subsection{Select methods}{
      % select and Deselect java doc shttp://selenium.googlecode.com/svn/trunk/docs/api/java/org/openqa/selenium/support/ui/Select.html
      These apply to web elements with tag 'select'.
     \describe{
       \item{\code{isMultiple}:}{Whether this select element support selecting multiple options at the same time? This is done by checking the value of the "multiple" attribute.} 
       \item{\code{getOptions}:}{Use this method to get all options belonging to this select tag}
       \item{\code{getAllSelectedOptions}:}{All selected options belonging to this select tag} 
       \item{\code{getFirstSelectedOption}:}{he first selected option in this select tag (or the currently selected option in a normal select)} 
       \item{\code{selectByVisibleText}:}{Select all options that display text matching the argument. That is, when given "Bar" this would select an option like: <option value="foo">Bar</option>}    
       \item{\code{selectByIndex}:}{Select the option at the given index. This is done by examing the "index" attribute of an element, and not merely by counting.} 
       \item{\code{selectByValue}:}{Select all options that have a value matching the argument. That is, when given "foo" this would select an option like: <option value="foo">Bar</option>} 
       \item{\code{deselectAll}:}{Clear all selected entries. This is only valid when the SELECT supports multiple selections.} 
       \item{\code{deselectByIndex}:}{Deselect the option at the given index. This is done by examing the "index" attribute of an element, and not merely by counting.} 
       \item{\code{deselectByValue}:}{Deselect all options that have a value matching the argument. That is, when given "foo" this would deselect an option like: <option value="foo">Bar</option>} 
       \item{\code{deselectByVisibleText}:}{Deselect all options that display text matching the argument. That is, when given "Bar" this would deselect an option like: <option value="foo">Bar</option>} 

    }
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

