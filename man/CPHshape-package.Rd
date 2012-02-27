\name{CPHshape-package}
\alias{CPHshape-package}
\alias{CPHshape}
\docType{package}
\title{Compute the MLE in the Cox proportional hazard model with shape constrained baseline}
\description{This package calculates the semi-parametric maximum likelihood estimator (MLE) of the effect parameters and the nonparametric hazard constrained to be either increasing, decreasing, unimodal, or u-shaped.  We assume that the times are continuous, and allow for right-censoring.}
\details{
\tabular{ll}{
Package: \tab CPHshape\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2012-03-06\cr
License: \tab GPL (>=2)\cr
LazyLoad: \tab yes\cr
}
The two main function in the package is \cr
\link[=find.shapeCPH]{find.shapeCPH}: Compute the maximum likelihood estimator of the effect parameters and the nonparametric shape constrained hazard in the proportional hazard model. \cr

The package also provides the function:

\link[=find.shapeMLE]{find.shapeMLE}: Compute the MLE of a nonparametric shape-constrained hazard.\cr\cr
}
\author{Rihong Hui and Hanna Jankowski <hkj@mathstat.yorku.ca>}
\references{
Grenander, U. (1956) On the theory of mortality measurement II.  \emph{Skand. Aktuarietidskr.} 39: 125-153.\cr\cr
Hui, R. and Jankowski, H. (2012).  Maximum likelihood estimation of a shape-constrained hazard in the proportional hazard model.  Technical Report.  \url{http://www.math.yorku.ca/~hkj/} \cr\cr
Jankowski, H. and Wellner, J. (2007) Nonparametric Estimation of a convex bathtub-shaped hazard function.   University of Washington Technical Report no. 521.  \url{http://www.stat.washington.edu/tech.reports/} \cr \cr
Mykytyn, S. and Santner, T. (1981) Maximum likelihood estimation of the survival function based on censored data under hazard rate assumptions.  \emph{Comm. Statist. A - Theory and Methods} 10 (14): 1369-1387.\cr\cr
Lopuhaa, H.P., Nane, G.F., Shape constrained nonparametric estimators of the baseline distribution in Cox proportional hazards model (2011).  Preprint. 
}
\keyword{package}
\examples{
# random sample from the proportional hazard model
n	<-	200
beta1	<-	1
beta2	<-	2
z1	<-	rbinom(n,1,0.5)
z2	<-	runif(n,-1,1)
w	<-	exp(beta1*z1+beta2*z2)
x	<-	rexp(n, rate=0.3*w)
delta	<-	1*(x<=2.5)
x	<-	pmin(x,2.5)

# compute MLE
mle	<-	find.shapeCPH(x, cbind(z1,z2) , delta, print=TRUE, type="decreasing")

# estimates of the effect parameter
mle$beta

# plot resulting estimate of baseline hazard

plot(mle)
abline(h=0.3, col="red") # add true baseline
rug(x)
}
