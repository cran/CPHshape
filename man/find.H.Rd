\name{find.H}
\alias{find.H}
\title{Calculate the cumulative hazard function}
\description{
This function calculates the cumulative hazard function at location \code{t} based on input from either \link[=find.shapeCPH]{find.shapeCPH} or \link[=find.shapeMLE]{find.shapeMLE}.}
\usage{find.H(t, h.val, h.ranges)}
\arguments{
  \item{t}{time at which to evaluate the cumulative hazard (must be univariate)}
  \item{h.val}{vector specifying changes of values in the hazard baseline MLE (output from e.g. \code{find.shapeCPH})}
  \item{h.ranges}{vector specifying locations of changes in values in the hazard baseline MLE (output from e.g. \code{find.shapeCPH})}
}
\value{A number giving the value of the estimated cumulative hazard at t.}
\author{Rihong Hui and Hanna Jankowski <hkj@mathstat.yorku.ca>}
\seealso{\link[=find.shapeCPH]{find.shapeCPH} \link[=find.shapeMLE]{find.shapeMLE}}
\examples{
# random sample from the uniform density
n	<-	500
x	<-	runif(n)

# compute MLE of increasing hazard
mle	<-	find.shapeMLE(x, type="increasing")

# find fitted cumulative hazard function at t=0.2
find.H(0.2, mle$h.val, mle$h.range)

}
