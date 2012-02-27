\name{plot.CPHshape}
\alias{plot.CPHshape}
\title{Plot a shape constrained MLE of a hazard function}
\description{\code{\link[graphics:plot]{plot}} method for class \code{"CPHshape"}.}
\usage{
\method{plot}{CPHshape}(x,  cex=0.5, xlim=range(x$h.range), ylim=range(x$h.val), 
xlab="", ylab="hazard function", \dots)
}
\arguments{
  \item{x}{object of class \code{"CPHshape"} (typically output from either \code{\link{find.shapeMLE}} or \code{\link{find.shapeCPH}}).}
  \item{cex}{A numerical value giving the amount by which plotting text and symbols should be magnified relative to the default.  In this setting, it changes the size of the dots representing continuity points of the hazard.  Default is set to 0.5.}
  \item{xlim}{limits of the x axis in the plot.  Defaults to full range of data.}
  \item{ylim}{limits of the y axis in the plot.  Defaults to full range of the MLE.}
  \item{xlab}{a label for the x axis. Defaults to empty.}
  \item{ylab}{a label for the y axis.  Default is set to "hazard function".}
  \item{\dots}{Aditional arguments}
}
\details{For examples, see \code{\link{find.shapeMLE}} or \code{\link{find.shapeCPH}}.}
\author{Hanna Jankowski <hkj@mathstat.yorku.ca>}
