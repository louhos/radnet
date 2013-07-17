\name{user_questions}
\alias{user_questions}
\title{Get questions asked by a user (defined by ID).}
\usage{
  user_questions(user.id, limit = 100)
}
\arguments{
  \item{user.id}{integer or String. ID of a user.}

  \item{limit}{integer. Maximum number of query items
  returned (default and max=100)}
}
\value{
  A DataFrame of questions. Each row has columns:
  \item{title}{Question asked.} \item{id}{Question ID.}
  \item{view_count}{How many times has the question been
  asked.} \item{votes}{Votes for the question.}
  \item{created}{When was the question created.}
  \item{answer_count}{How many answers the questions has.}
  \item{url}{URL to the question.}
}
\description{
  Get questions asked by a user (defined by ID).
}
\examples{
user.questions <- user_questions(2)
user.questions <- user_questions(2, limit=5)
}
\author{
  Joona Lehtomaki <joona.lehtomaki@gmail.com>
}
\seealso{
  userinfo response2df
}
\keyword{avoindata,}
\keyword{questions,}
\keyword{users}

