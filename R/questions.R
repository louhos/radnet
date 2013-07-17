#' Get questions (max 100) related to a single category.
#'
#' @keywords avoindata, categories, questions
#' @author Joona Lehtomaki <joona.lehtomaki@@gmail.com>
#' 
#' @param category.id integer or String. catid of a category.
#' @param limit integer. Maximum number of query items returned (default and max=100)
#' @return A DataFrame of tags. Each row has columns title, count, and wordid
#' 
#' @export
#' @examples
#' questions <- latest_questions(27)
#' questions <- latest_questions(27, limit=10)
#' @seealso catinfo response2df
latest_questions <- function(category.id, limit=100) {
  # First check that the category id is found
  categories <- catinfo()
  if (!category.id %in% categories$catid) {
    stop(paste('Category id', category.id, 'not found in API'))
  }
  if (limit < 1 || limit > 100) {
    stop('Questions limit must be an integer [1, 100]')
  }
  
  url <- paste0(get('categories.url', envir=urlEnv), '/id/',
                category.id, '?limit=', limit)
    
  questions <- response2df(url, tags=TRUE)
  # Convert the epochs to ISO 8601 date format
  questions$created <- epoch2dtime(questions$created)
  
  return(questions)
}

#' Get all the questions asked during a month/year.
#'
#' Providing just a month number [1, 12] will assume current year.
#' Future years are excluded, but historically there are no restrictions.
#' However, years <2013 probably do not return anything.
#'
#' @keywords avoindata, categories, questions
#' @author Joona Lehtomaki <joona.lehtomaki@@gmail.com>
#' 
#' @param month integer or String. Number of the month [1, 12].
#' @param year integer or String. Year (default: NULL), if none 
#'    is provided assume current year.
#' @return A DataFrame of questions which as following columns:
#' \item{title}{Questions title.}
#' \item{id}{ID number.}
#' \item{view_count}{How many times has the question been viewed.}
#' \item{votes}{Number of votes.}
#' \item{created}{Creation date.}
#' \item{updated}{Update time (0=has not been updated).}
#' \item{answer_count}{Number of answers.}
#' \item{url}{URL of the question.}
#' \item{tags}{Tags associated with the question.}
#' 
#' @importFrom httr GET
#' @importFrom httr content
#' @export
#' @examples
#' this.mar <- questions_in(month=5)
#' mar.2013 <- questions_in(month=5, year=2013)
#' @seealso catinfo
questions_in <- function(month, year=NULL) {
  month  <- as.numeric(month)
  # First check that the month number is proper
  if (!month %in% 1:12) {
    stop(paste('Month number must be between 1 and 12'))
  }
  # Then check the year, if provided.
  if (!is.null(year)) {
    year <- as.numeric(year)
    current.year <- as.numeric(format(Sys.time(), "%Y"))
    if (year > current.year) {
      stop(paste0('Year cannot be from the future (', current.year, ')'))
    }
    url <- paste0(get('questions.url', envir=urlEnv), '/', year, '/', month)
  } else {
    url <- paste0(get('questions.url', envir=urlEnv), '/month/', month)
  }
  
  questions <- response2df(url, tags=TRUE)
  # Convert the epochs to ISO 8601 date format
  questions$created <- epoch2dtime(questions$created)
  questions$updated <- epoch2dtime(questions$updated)
    
  return(questions)
}

#' Get the amount of questions per day.
#'
#' @keywords avoindata, categories, questions
#' @author Joona Lehtomaki <joona.lehtomaki@@gmail.com>
#' 
#' @return A DataFrame. Each row has a count and date column.
#' 
#' @export
#' @examples
#' nq <- count_questions()
#' #' @seealso response2df nanswers
count_questions <- function() {
  return(response2df(get('questions.url', envir=urlEnv)))
}