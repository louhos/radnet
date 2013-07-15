\name{getlatest}
\alias{getlatest}
\title{Get latest 10 questions labelled with a given tag.}
\usage{
  getlatest(name = NULL, ID = NULL)
}
\arguments{
  \item{name}{String. Name of the tag used.}

  \item{id}{integer or String. Wordid that can be used
  alternatively.}
}
\value{
  A list of tag items. Each item has attributes title,
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
tags <- get_tags()
}
\author{
  Joona Lehtomäki <joona.lehtomaki@gmail.com>
}
\keyword{avoindata,}
\keyword{tags}

