% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/MFPCAfit_methods.R
\name{plot.MFPCAfit}
\alias{plot.MFPCAfit}
\title{Plot MFPCA results}
\usage{
\method{plot}{MFPCAfit}(x, plotPCs = seq_len(nObs(x$functions)),
  stretchFactor = NULL, combined = FALSE, ...)
}
\arguments{
\item{x}{An object of class \code{MFPCAfit}, typically returned by the 
\link{MFPCA} function.}

\item{plotPCs}{The principal components to be plotted. Defaults to all 
components in the \code{MFPCAfit} object.}

\item{stretchFactor}{The factor by which the principal components are 
multiplied before adding / subtracting them from the mean function. If 
\code{NULL} (the default), the median absolute value of the scores of each 
eigenfunction is used.}

\item{combined}{Logical: Should the plots be combined? (Works only if all 
dimensions are one-dimensional). Defaults to \code{FALSE}.}

\item{...}{Further graphical parameters passed to the
\link[funData]{plot.funData} functions for functional data.}
}
\value{
A plot of the principal components as perturbations of the mean.
}
\description{
Plots the eigenfunctions as perturbations of the mean (i.e. the mean function
plus/minus a constant factor times each eigenfunction separately). If all 
elements have a one-dimensional domain, the plots can be combined, otherwise 
the effects of adding and subtracting are shown in two separate rows for each
eigenfunction.
}
\examples{
# Simulate multivariate functional data on one-dimensonal domains
# and calculate MFPCA (cf. MFPCA help)
set.seed(1)
# simulate data (one-dimensional domains)
sim <-  simMultiFunData(type = "split", argvals = list(seq(0,1,0.01), seq(-0.5,0.5,0.02)),
                       M = 5, eFunType = "Poly", eValType = "linear", N = 100)
# MFPCA based on univariate FPCA
PCA <- MFPCA(sim$simData, M = 5, uniExpansions = list(list(type = "uFPCA"),
                                                     list(type = "uFPCA")))

# Plot the results
plot(PCA, combined = TRUE) # combine addition and subtraction in one plot
}
\seealso{
\code{\link{MFPCA}}, \code{\link[funData]{plot.funData}}
}
