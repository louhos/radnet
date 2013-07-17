\name{response2df}
\alias{response2df}
\title{Retrieve a repsonse from a specified URL and convert it to a
DataFrame.}
\usage{
  response2df(url, tags = FALSE)
}
\arguments{
  \item{url}{String url}

  \item{tags}{boolean indicating whether repsonse has tags
  to be collapsed (default: FALSE)}
}
\value{
  A DataFrame from the response
}
\description{
  Retrieve a repsonse from a specified URL and convert it
  to a DataFrame.
}
\author{
  Joona Lehtomaki <joona.lehtomaki@gmail.com>
}
\seealso{
  radnet_urls()
}
\keyword{dates,}
\keyword{time}

