% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bootnet.r
\name{bootnet}
\alias{bootnet}
\alias{resample_graph}
\alias{bootnet}
\alias{c.diffnet_bootnet}
\alias{print.diffnet_bootnet}
\alias{hist.diffnet_bootnet}
\title{Network Bootstrapping}
\usage{
resample_graph(graph, self = NULL, useR = FALSE, ...)

bootnet(graph, statistic, R, resample.args = list(self = FALSE), ...)

\method{c}{diffnet_bootnet}(..., recursive = FALSE)

\method{print}{diffnet_bootnet}(x, ...)

\method{hist}{diffnet_bootnet}(x,
  main = "Empirical Distribution of Statistic", xlab = expression(Values ~
  of ~ t), breaks = 20, annotated = TRUE, b0 = expression(atop(plain("")
  \%up\% plain("")), t[0]), b = expression(atop(plain("") \%up\% plain("")),
  t[]), ask = TRUE, ...)
}
\arguments{
\item{graph}{Any class of accepted graph format (see \code{\link{netdiffuseR-graphs}}).}

\item{self}{Logical scalar. When \code{TRUE} autolinks (loops, self edges) are allowed (see details).}

\item{useR}{Logical scalar. When \code{TRUE}, autolinks are filled using an
\R based rutine. Otherwise it uses the \pkg{Rcpp} implementation (default).
This is intended for testing only.}

\item{...}{Further arguments passed to the method (see details).}

\item{statistic}{A function that returns a vector with the statistic(s) of interest.
The first argument must be the graph, and the second argument a vector of indices
(see details)}

\item{R}{Number of reps}

\item{resample.args}{List. Arguments to be passed to \code{\link{resample_graph}}}

\item{recursive}{Ignored}

\item{x}{A \code{diffnet_bootnet} class object.}

\item{main}{Character scalar. Title of the histogram.}

\item{xlab}{Character scalar. x-axis label.}

\item{breaks}{Passed to \code{\link{hist}}.}

\item{annotated}{Logical scalar. When TRUE marks the observed data average and the simulated data average.}

\item{b0}{Character scalar. When \code{annotated=TRUE}, label for the value of \code{b0}.}

\item{b}{Character scalar. When \code{annotated=TRUE}, label for the value of \code{b}.}

\item{ask}{Logical scalar. When \code{TRUE}, asks the user to type \code{<Enter>} to
see each plot (as many as statistics where computed).}
}
\value{
A list of class \code{diffnet_bootnet} containing the following:
\item{graph}{The graph passed to \code{bootnet}.}
\item{p.value}{The resulting p-value of the test (see details).}
\item{t0}{The observed value of the statistic.}
\item{mean_t}{The average value of the statistic applied to the simulated networks.}
\item{var_t}{A vector of length \code{length(t0)}. Bootstrap variances.}
\item{R}{Number of simulations.}
\item{statistic}{The function \code{statistic} passed to \code{bootnet}.}
\item{boot}{A \code{boot} class object as return from the call to \code{boot}.}
\item{resample.args}{The list \code{resample.args} passed to \code{bootnet}.}
}
\description{
Implements the bootstrapping method described in Snijders and Borgatti (1999).
This function is essentially a wrapper of \code{\link[boot:boot]{boot}}.
}
\details{
Just like the \code{boot} function of the \pkg{boot} package, the \code{statistic}
that is passed must have as arguments the original data (the graph in this case),
and a vector of indicides. In each repetition, the graph that is passed is a
resampled version generated as described in Snijders and Borgatti (1999).

When \code{self = FALSE}, for pairs of individuals that haven been drawn more than
once the algorithm, in particular, \code{resample_graph}, takes care of filling
these pseudo autolinks that are not in the diagonal of the network. By default
it is assumed that these pseudo-autolinks depend on whether the original graph
had any, hence, if the diagonal has any non-zero value the algorithm assumes that
\code{self = TRUE}, skiping the 'filling algorithm'. It is important to notice
that, in order to preserve the density of the original network, when
assigning an edge value to a pair of the form \eqn{(i,i)} (pseudo-autolinks),
such is done with probabilty proportional to the density of the network, in
other words, before choosing from the existing list of edge values, the
algorithm decides whether to set a zero value first.

The vector of indices that is passed to \code{statistic}, an integer vector with range
1 to \eqn{n}, corresponds to the drawn sample of nodes, so the user can, for
example, use it to get a subset of a \code{data.frame} that will be used with
the \code{graph}.
}
\examples{
#
set.seed(13)
g <- rgraph_ba(t=99)

ans <- bootnet(g, function(w, ...) length(w@x), R=100)
ans
}
\references{
Snijders, T. A. B., & Borgatti, S. P. (1999). Non-Parametric
Standard Errors and Tests for Network Statistics. Connections, 22(2), 1–10.
Retrieved from \url{https://insna.org/PDF/Connections/v22/1999_I-2_61-70.pdf}
}
\seealso{
Other Functions for inference: \code{\link{moran}},
  \code{\link{struct_test}}
}
