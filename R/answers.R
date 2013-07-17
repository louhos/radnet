#' Get the amount of answers per day.
#'
#' @keywords avoindata, categories, answers
#' @author Joona Lehtomaki <joona.lehtomaki@@gmail.com>
#' 
#' @return A DataFrame. Each row has a count and date column.
#' 
#' @export
#' @examples
#' nq <- nanswers()
#' @seealso response2df nquestions
count_answers <- function() {
  return(response2df(get('answers.url', envir=urlEnv)))
}