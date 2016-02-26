\name{nyc}
\docType{data}
\alias{nyc}
\alias{nycMapEnv}
\title{
New York City Borders
}
\usage{data(nycMapEnv)}
\description{

This database produces a map of the borders of New York City.
}
\format{
The data file is merely a character string which
specifies the name of an environment variable which contains the
base location of the binary files used by the map drawing functions.
This environment variable (\code{R_MAP_DATA_DIR} for the datasets in the
maps package) is set at package load time \emph{if it does not
already exist}.  Hence setting the environment variable before loading
the package can override the default location of the binary datasets.
}
\seealso{
\code{\link{map}}.
}
\examples{
map('usa')
}
\references{
Richard A. Becker, and Allan R. Wilks,
"Maps in S",
\emph{AT\&T Bell Laboratories Statistics Research Report [93.2], 1993.}

Richard A. Becker, and Allan R. Wilks,
"Constructing a Geographical Database",
\emph{AT\&T Bell Laboratories Statistics Research Report [95.2], 1995.}

New York City Open Gov Datasets.
}
\keyword{datasets}
