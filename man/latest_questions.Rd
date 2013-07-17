\name{latest_questions}
\alias{latest_questions}
\title{Get questions (max 100) questions related to a single category.}
\usage{
  latest_questions(category.id, limit = 100)
}
\arguments{
  \item{category.id}{integer or String. catid of a
  category.}

  \item{limit}{integer. Maximum number of query items
  returned (default and max=100)}
}
\value{
  A DataFrame of tags. Each row has columns title, count,
  and wordid
}
\description{
  Get questions (max 100) questions related to a single
  category.
}
\examples{
questions <- latest_questions(27)
}
\author{
  Joona Lehtomaki <joona.lehtomaki@gmail.com>
}
\seealso{
  catinfo
}
\keyword{avoindata,}
\keyword{categories,}
\keyword{questions}

