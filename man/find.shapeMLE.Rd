\name{find.shapeMLE}
\alias{find.shapeMLE}
\title{Compute the MLE of a shape-constrained hazard function}
\description{Compute the maximum likelihood estimator (MLE) of a shape-constrained hazard function under IID sampling.  We assume that the data are continuous and allow for right censoring.  The function 'find.shapeMLE' allows for four different shape constraints: increasing, decreasing, unimodal, and u-shaped.}
\usage{
find.shapeMLE(x, delta=rep(1, length(x)), type = "increasing", plot = FALSE)
}
\arguments{
  \item{x}{vector of length n containing the data}
  \item{delta}{logical vector containing the (right) censoring information.  If delta_i=1 then the observation was not censored.  The default is delta_i=1 for all i, that is, assuming that no observations were censored.}
  \item{type}{string indicating type of shape constraint.  Options are "increasing", "decreasing", "unimodal", and "ushaped".}	
  \item{plot}{logical, if TRUE, the graphical representation of the MLE is shown}
}
\value{A list containing the following elements:
\item{h.range}{endpoints for the values of the hazard MLE}
\item{h.val}{values of the hazard MLE in between the endpoints}
\item{phi}{the criterion function \code{Phi} (negative log-likelihood) evaluated at the MLE}
\item{H}{the cumulative hazard MLE evaluated at the data points}
\item{mode}{location of the mode (for unimodal) or antimode (for u-shaped).  Note that the antimode is not unique, and the midpoint of all possible values is returned.}
\item{type}{string indicating type of shape constraint used}
}
\references{
Hui, R. and Jankowski, H. (2012).  Maximum likelihood estimation of a shape-constrained hazard in the proportional hazard model.  Technical Report.  \url{http://www.math.yorku.ca/~hkj/}
}
\author{Rihong Hui and Hanna Jankowski <hkj@mathstat.yorku.ca>}
\note{The MLE can be found in different ways.  We use the graphical representation via convex minorants or concave majorants of appropriate functions.  Also, for the increasing and unimodal setting, the MLE takes the value of infinity at the mode (the largest observation for \code{type="increasing"}).  In such situations, this value is removed from the likelihood in the maximization process.  A similar approach was taken in Gernander (1956).}
\examples{
# random sample from the uniform density
n	<-	500
x	<-	runif(n)

# compute MLE of increasing hazard
mle	<-	find.shapeMLE(x, type="increasing")


# plot the fitted hazard
plot(mle)
rug(x)

# add true hazard to the plot
h.true	<-	function(x) 1/(1-x)
plot(h.true, col="red", add=TRUE)

}
