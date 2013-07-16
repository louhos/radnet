\name{catinfo}
\alias{catinfo}
\title{Get all the tags, counts, and wordids.}
\usage{
  catinfo()
}
\value{
  A DataFrame with each row containg columns title, count,
  and catid
}
\description{
  Get all the tags, counts, and wordids.
}
\note{
  Should the results be cached?
}
\examples{
categories <- catinfo()
}
\author{
  Joona Lehtomaki <joona.lehtomaki@gmail.com>
}
\seealso{
  response2df
}
\keyword{avoindata,}
\keyword{categories}

