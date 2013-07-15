\name{latest_questions}
\alias{latest_questions}
\title{Get questions (max 100) questions related to a single category.}
\usage{
  latest_questions(category.id, limit = 100)
}
\arguments{
  \item{id}{integer or String. catid of a category.}

  \item{limit}{integer. Maximum number of query items
  returned (default and max=100)}
}
\value{
  A list of tag items. Each item has attributes title,
  count, and wordid
}
\description{
  Get questions (max 100) questions related to a single
  category.
}
\examples{
questions <- latest_questions()
}
\author{
  Joona Lehtomäki <joona.lehtomaki@gmail.com>
}
\seealso{
  catinfo
}
\keyword{avoindata,}
\keyword{categories}

