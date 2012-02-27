\name{find.shapeCPH}
\alias{find.shapeCPH}
\title{Compute the MLE of the effect parameters and shape-constrained baseline in the Cox model}
\description{Compute the maximum likelihood estimator (MLE) of the shape-constrained hazard baseline and the effect parameters in the Cox proportional hazards model under IID sampling.  We assume that the data are continuous and allow for right censoring.  The function 'find.shapeMLE' allows for four different shape constraints: increasing, decreasing, unimodal, and u-shaped.}
\usage{
find.shapeCPH(x, z, delta, type="increasing", 
beta0=rep(1, length(as.matrix(z)[1,])), max.loop=250, eps=1e-5, 
eps.beta=1e-5, print=FALSE)
}
\arguments{
  \item{x}{vector of length n containing the data}
  \item{z}{matrix of size n x p containing the covariate values}
  \item{delta}{logical vector containing the (right) censoring information.  If delta_i=1 then the observation was not censored.  The default is delta_i=1 for all i, that is, no observations were censored.}
  \item{type}{string indicating type of shape constraint.  Options are "increasing", "decreasing", "unimodal", and "ushaped".}	
  \item{beta0}{vector of length p containing the starting value of beta for the algorithm.  The default is all elements equal to one.}
  \item{max.loop}{maximum number of iterations.  The default is 250.}
  \item{eps}{precision for stopping criterion. The default is 1e-05.}
  \item{eps.beta}{precision for second stopping criterion. The default is 1e-05.}
  \item{print}{logical, if TRUE, output from each iteration of the algorithm is shown.  The default is FALSE.}
}
\value{A list containing the following elements:
\item{beta}{MLE of the effect parameters}
\item{h.range}{endpoints for the values of the hazard MLE}
\item{h.val}{values of the hazard MLE}
\item{phi}{the criterion function \code{Phi} evaluated at the MLE}
\item{H}{the cumulative hazard MLE evaluated at the data points}
\item{mode}{location of the mode (for unimodal) or antimode (for u-shaped).  Note that the antimode is not unique, and the midpoint of all possible values is returned.}
\item{type}{string indicating type of shape constraint used}
}
\references{Hui, R. and Jankowski, H. (2012).  Maximum likelihood estimation of a shape-constrained hazard in the proportional hazard model.  Technical Report.  \url{http://www.math.yorku.ca/~hkj/} \cr\cr
Mykytyn, S. and Santner, T. (1981) Maximum likelihood estimation of the survival function based on censored data under hazard rate assumptions.  \emph{Comm. Statist. A - Theory and Methods} 10 (14): 1369-1387.\cr\cr
}
\author{Rihong Hui and Hanna Jankowski <hkj@mathstat.yorku.ca>}
\note{For the increasing and unimodal setting, the MLE takes the value of infinity at the mode (the largest observation for \code{type="increasing"}).  In such situations, this value is removed from the likelihood in the maximization process.  A similar approach was taken in Gernander (1956).\cr
We note also that for the shapes \code{type="unimodal"} and \code{type="ushaped"} the algorithm can take some time, especially for larger sample sizes.
}
\examples{# random sample from the proportional hazard model
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
