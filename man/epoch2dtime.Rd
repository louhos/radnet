\name{epoch2dtime}
\alias{epoch2dtime}
\title{Convert a standard Unix epoch value to ISO 8601 date format.}
\usage{
  epoch2dtime(epoch)
}
\arguments{
  \item{epoch}{integer value for the epoch}
}
\value{
  POSIXct object corresponding to the epoch value provided
}
\description{
  Convert a standard Unix epoch value to ISO 8601 date
  format.
}
\examples{
epoch2dtime(1367244015)
"2013-04-29 17:00:15 EEST"
}
\author{
  Joona Lehtomäki <joona.lehtomaki@gmail.com>
}
\keyword{dates,}
\keyword{time}

