\name{find.hazard}
\alias{find.hazard}
\title{Calculate the hazard function}
\description{
This function calculates the hazard function at location \code{t} based on input resulting from either \link[=find.shapeCPH]{find.shapeCPH} or \link[=find.shapeMLE]{find.shapeMLE}.}
\usage{find.hazard(t, h.val, h.ranges, type, mode)}
\arguments{
  \item{t}{time at which to evaluate the hazard (must be univariate)}
  \item{h.val}{vector specifying changes of values in the hazard baseline MLE (output from e.g. \code{find.shapeCPH})}
  \item{h.ranges}{vector specifying locations of changes in values in the hazard baseline MLE (output from e.g. \code{find.shapeCPH})}
  \item{type}{type of shape constrained used (also given as output from e.g. \code{find.shapeCPH})}	
  \item{mode}{location of mode or antimode (also given as output from e.g. \code{find.shapeCPH}).  Not required for the increasing or decreasing shapes.}	
}
\value{A number giving the value of the estimated hazard at t.}
\author{Rihong Hui and Hanna Jankowski <hkj@mathstat.yorku.ca>}
\seealso{\link[=find.shapeCPH]{find.shapeCPH} \link[=find.shapeMLE]{find.shapeMLE}}
\examples{
# random sample from the uniform density
n	<-	100
x	<-	runif(n)

# compute MLE of increasing hazard and evaluate fitted hazard at t=0.2
mle	<-	find.shapeMLE(x, type="increasing")
find.hazard(0.2, mle$h.val, mle$h.range, type=mle$type)


# compute MLE of unimodal hazard and evaluate fitted hazard at t=0.2
mle	<-	find.shapeMLE(x, type="unimodal")
find.hazard(0.2, mle$h.val, mle$h.range, type=mle$type, mode=mle$mode)
}
