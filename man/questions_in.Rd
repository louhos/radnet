\name{questions_in}
\alias{questions_in}
\title{Get all the questions asked during a month/year.}
\usage{
  questions_in(month, year = NULL)
}
\arguments{
  \item{month}{integer or String. Number of the month [1,
  12].}

  \item{year}{integer or String. Year (default: NULL), if
  none is provided assume current year.}
}
\value{
  A DataFrame of questions which as following columns:
  \item{title}{Questions title.} \item{id}{ID number.}
  \item{view_count}{How many times has the question been
  viewed.} \item{votes}{Number of votes.}
  \item{created}{Creation date.} \item{updated}{Update time
  (0=has not been updated).} \item{answer_count}{Number of
  answers.} \item{url}{URL of the question.}
  \item{tags}{Tags associated with the question.}
}
\description{
  Providing just a month number [1, 12] will assume current
  year. Future years are excluded, but historically there
  are no restrictions. However, years <2013 probably do not
  return anything.
}
\examples{
this.mar <- questions_in(month=5)
mar.2013 <- questions_in(month=5, year=2013)
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

