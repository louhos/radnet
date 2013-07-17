\name{userinfo}
\alias{userinfo}
\title{Get all the users of the Q&A forum}
\usage{
  userinfo()
}
\value{
  A DataFrame with each row containg following columns
  \item{handle}{User handle.} \item{userid}{User ID.}
  \item{points_count}{How many points user has.}
  \item{questions_count}{How many questions user has
  asked.} \item{answers_count}{How many questions user has
  answered.} \item{created}{When was user account created.}
  \item{lastlogin}{When did the user login the last time.}
}
\description{
  Get all the users of the Q&A forum
}
\examples{
users <- userinfo()
}
\author{
  Joona Lehtomaki <joona.lehtomaki@gmail.com>
}
\seealso{
  response2df
}
\keyword{avoindata,}
\keyword{users}

