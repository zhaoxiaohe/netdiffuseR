% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/misc.r
\name{drawColorKey}
\alias{drawColorKey}
\title{Draw a color key in the current device}
\usage{
drawColorKey(x, tick.marks = pretty_within(x), labels = tick.marks,
  main = NULL, key.pos = c(0.925, 0.975, 0.05, 0.95), pos = 2,
  nlevels = length(tick.marks),
  color.palette = (grDevices::colorRampPalette(c("steelblue", "gray",
  "tomato")))(nlevels), tick.width = c(0.01, 0.0075), add.box = TRUE,
  na.col = NULL, na.height = 0.1, na.lab = "n/a", ...)
}
\arguments{
\item{x}{A numeric vector with the data (it is used to extract the range).}

\item{tick.marks}{A numeric vector indicating the levels to be included in the axis.}

\item{labels}{Character vector. When provided, specifies using different
labels for the tick marks than those provided by \code{tick.marjks}.}

\item{main}{Character scalar. Title of the key.}

\item{key.pos}{A numeric vector of length 4 with relative coordinates of the
key (as \% of the plotting area, see  \code{\link[graphics:par]{par("usr")}})}

\item{pos}{Integer scalar. Position of the axis as in \code{\link[graphics:text]{text}}.}

\item{nlevels}{Integer scalar. Number of levels (colors) to include in the color key.}

\item{color.palette}{Color palette of \code{length(nlevels)}.}

\item{tick.width}{Numeric vector of length 2 indicating the length of the inner
and outer tick marks as percentage of the axis.}

\item{add.box}{Logical scalar. When \code{TRUE} adds a box around the key.}

\item{na.col}{Character scalar. If specified, adds an aditional box indicating the NA color.}

\item{na.height}{Numeric scalar. Relative height of the NA box. Only use if
\code{na.col} is not \code{NULL}.}

\item{na.lab}{Character scalar. Label of the \code{NA} block. Only use if
\code{na.col} is not \code{NULL}.}

\item{...}{Further arguments to be passed to \code{\link[graphics:rect]{rect}}}
}
\value{
Invisible \code{NULL}.
}
\description{
Draw a color key in the current device
}
\examples{
set.seed(166)
x <- rnorm(100)
col <- colorRamp(c("lightblue", "yellow", "red"))((x - min(x))/(max(x) - min(x)))
col <- rgb(col, maxColorValue = 255)
plot(x, col=col, pch=19)
drawColorKey(x, nlevels = 100, border="transparent",
 main="Key\\nLike A\\nBoss")
}
\seealso{
Other visualizations: \code{\link{dgr}},
  \code{\link{diffusionMap}},
  \code{\link{grid_distribution}},
  \code{\link{hazard_rate}}, \code{\link{plot_adopters}},
  \code{\link{plot_diffnet2}}, \code{\link{plot_diffnet}},
  \code{\link{plot_infectsuscep}},
  \code{\link{plot_threshold}},
  \code{\link{rescale_vertex_igraph}}
}
\author{
George G. Vega Yon
}
\keyword{misc}
