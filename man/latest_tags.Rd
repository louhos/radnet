\name{latest_tags}
\alias{latest_tags}
\title{Get latest 10 questions labelled with a given tag.}
\usage{
  latest_tags(name = NULL, id = NULL)
}
\arguments{
  \item{name}{String. Name of the tag used.}

  \item{id}{integer or String. Wordid that can be used
  alternatively.}
}
\value{
  A DataFrame of tag items. Each row has attributes title,
  count, and wordid
}
\description{
  Get latest 10 questions labelled with a given tag.
}
\note{
  Name takes precedence over id. If both are provided, id
  is only tried if name fails.
}
\examples{
tags <- latest_tags('Tampere')
}
\author{
  Joona Lehtomaki <joona.lehtomaki@gmail.com>
}
\keyword{avoindata,}
\keyword{tags}

