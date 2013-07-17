options(stringsAsFactors=FALSE)
#' Get all the users of the Q&A forum
#'
#' @keywords avoindata, users
#' @author Joona Lehtomaki <joona.lehtomaki@@gmail.com>
#'
#' @return A DataFrame with each row containg following columns
#' \item{handle}{User handle.}
#' \item{userid}{User ID.}
#' \item{points_count}{How many points user has.}
#' \item{questions_count}{How many questions user has asked.}
#' \item{answers_count}{How many questions user has answered.}
#' \item{created}{When was user account created.}
#' \item{lastlogin}{When did the user login the last time.}
#'
#' @export
#' @examples
#' users <- userinfo()
#' @seealso response2df
userinfo <- function(){
  users <- response2df(get('users.url', envir=urlEnv))
  users$created <- epoch2dtime(users$created)
  users$lastlogin <- epoch2dtime(users$lastlogin)
  return(users)
}

#' Get questions asked by a user (defined by ID).
#'
#' @keywords avoindata, questions, users
#' @author Joona Lehtomaki <joona.lehtomaki@@gmail.com>
#' 
#' @param user.id integer or String. ID of a user.
#' @param limit integer. Maximum number of query items returned (default and max=100)
#' @return A DataFrame of questions. Each row has columns:
#' \item{title}{Question asked.}
#' \item{id}{Question ID.}
#' \item{view_count}{How many times has the question been asked.}
#' \item{votes}{Votes for the question.}
#' \item{created}{When was the question created.}
#' \item{answer_count}{How many answers the questions has.}
#' \item{url}{URL to the question.}
#' 
#' @export
#' @examples
#' user.questions <- user_questions(2)
#' user.questions <- user_questions(2, limit=5)
#' @seealso userinfo response2df
user_questions <- function(user.id, limit=100) {
  # First check that the user id is found
  users <- userinfo()
  if (!user.id %in% users$userid) {
    stop(paste('User id', user.id, 'not found in API'))
  }
  if (limit < 1 || limit > 100) {
    stop('Questions limit must be an integer [1, 100]')
  }
  
  url <- paste0(get('users.url', envir=urlEnv), '/id/',
                user.id, '/questions', '?limit=', limit)
  
  user.questions <- response2df(url)
  if (!is.null(user.questions)) {
    # Convert the epochs to ISO 8601 date format
    user.questions$created <- epoch2dtime(user.questions$created)
  }  
  return(user.questions)
}