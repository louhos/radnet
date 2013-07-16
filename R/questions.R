#' Get questions (max 100) questions related to a single category.
#'
#' @keywords avoindata, categories, questions
#' @author Joona Lehtomaki <joona.lehtomaki@@gmail.com>
#' 
#' @param category.id integer or String. catid of a category.
#' @param limit integer. Maximum number of query items returned (default and max=100)
#' @return A list of tag items. Each item has attributes title, count, and wordid
#' 
#' @importFrom httr GET
#' @importFrom httr content
#' @export
#' @examples
#' questions <- latest_questions(27)
#' @seealso catinfo

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
  
  questions <- httr::content(httr::GET(url), as='parsed')
  
  if (length(questions[[1]]) == 0) {
    stop(paste('Empty response with url:', url))
  } else {
    # Handle tags (can be several as an array)
    for (i in 1:length(questions[[1]])) {
      tags <- questions[[1]][[i]]$tags
      if (is.null(tags) || tags == 'NULL') {
        tags <- ''
      }
      questions[[1]][[i]]$tags <- paste(tags, collapse=', ')
    }
    questions <- do.call(rbind.data.frame, questions[[1]])
    rownames(questions) <- NULL
    # Convert the epochs to ISO 8601 date format
    questions$created <- epoch2dtime(questions$created)
    
    return(questions)
  }
}

#' Get the amount of quesitions per day.
#'
#' @keywords avoindata, categories, questions
#' @author Joona Lehtomaki <joona.lehtomaki@@gmail.com>
#' 
#' @return A DataFrame. Each row has a count and date column.
#' 
#' @importFrom httr GET
#' @importFrom httr content
#' @export
#' @examples
#' nq <- nquestions()
nquestions <- function() {
  
}