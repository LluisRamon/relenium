\name{webElementClass}
\docType{class}

\alias{webElementClass}

\title{Class  \code{webElementClass}. A class to represent a remote web element}

\description{
  This class is designed to represent and interact with a remote web element.
}

\details{

  The webElement class is implemented as a reference class
  (see \code{\link{setRefClass}} for more details). This class is designed to represent and interact with a remote web element.
 
  It represents an HTML element. Generally, all interesting operations to do with interacting with a page will be performed through this interface.
 
  You get a \code{webElementClass} from \code{\link{firefoxClass}} find methods or from other \code{webElementClass}. With this class you can navigate, select, web data extraction and find web elements.
 
    All methods implemented are explained below. Documentation is based in the original Selinum Java documentation. It is possible to access the methods with TAB completion.
   
  An example of \code{webElementClass} can be found using \code{demo(package = "relenium")}.
  
}

\section{Fields}{
  \describe{
     \item{\code{keys}:}{This is a list of the available keys that can be used in the 'sendKeys' method. They refer to keys of the keyboard.}
  }
}

\section{Methods}{

  \subsection{Navigate and web data extraction}{
    
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
     \item{\code{printHtml}:}{Parse and print the inner html code of this element. It is like getHtml but it returns the html code in a more readable form.}
     \item{\code{isDisplayed}:}{Is this element displayed or not?} 
     \item{\code{isEnabled}:}{Is the element currently enabled or not? This will generally return true for everything but disabled input elements}
     \item{\code{isSelected}:}{Determine whether or not this element is selected or not. This operation only applies to input elements such as checkboxes, options in a select and radio buttons. It returns True if the element is currently selected or checked, false otherwise.} 
     \item{\code{sendKeys}:}{Use this method to simulate typing into an element, which may set its value.} 
     \item{\code{submit}:}{If this current element is a form, or an element within a form, then this will be submitted to the remote server.} 

     }
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
     \item{\code{findElementByCssSelector}:}{Use this method to find elements via the driver's underlying W3 Selector engine. If the browser does not implement the Selector API, a best effort is made to emulate the API.}
     \item{\code{findElementById}:}{Use this method when you know \emph{id} attribute of an element. With this strategy, the first element with the \emph{id} attribute value matching the location will be returned.}
     \item{\code{findElementByName}:}{Use this method when you know the \emph{name} attribute of an element. With this strategy, the first element with the \emph{name} attribute value matching the location will be returned.}
     \item{\code{findElementByLinkText}:}{Use this method when you know \emph{text} of an element. With this strategy, the first element matching the \emph{exact text} will be returned.}    
     \item{\code{findElementByPartialLinkText}:}{Use this method when you know \emph{text} of an element. With this strategy, the first element matching the \emph{partial text} will be returned.}
     \item{\code{findElementByTagName}:}{Use this method when you know the \emph{tag name} of an element. With this strategy, the first element matching the \emph{tag name} will be returned.}
   
  }
  
  To find multiple elements use the following methods in the same way as the previous ones. Note that these methods will return a list.
   
    \itemize{
         \item{\code{findElementsByXPath}}
         \item{\code{findElementsByClassName}}
         \item{\code{findElementsByCssSelector}}
         \item{\code{findElementsById}}
         \item{\code{findElementByPartialLinkText}}
         \item{\code{findElementsByLinkText}}
         \item{\code{findElementsByName}}
         \item{\code{findElementsByPartialLinkText}}
         \item{\code{findElementsByTagName}}
    }
    }
 
}

\seealso{
  \code{\link{setRefClass}}, \code{\link{relenium-package}}, \code{\link{firefoxClass}}
}
