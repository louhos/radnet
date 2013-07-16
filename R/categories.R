options(stringsAsFactors=FALSE)
#' Get all the tags, counts, and wordids.
#'
#' @keywords avoindata, categories
#' @author Joona Lehtomäki <joona.lehtomaki@@gmail.com>
#'
#' @return A DataFrame with each row containg columns title, count, and catid
#'
#' @importFrom httr GET
#' @importFrom httr content
#' @export
#' @examples
#' categories <- catinfo()
#' @note Should the results be cached?

catinfo <- function(){
  categories <- httr::content(httr::GET(get('categories.url', envir=cacheEnv)), 
                        as='parsed') 
  categories <- do.call(rbind.data.frame, categories[[1]])
  rownames(categories) <- NULL
  return(categories)
}

#' Get questions (max 100) questions related to a single category.
#'
#' @keywords avoindata, categories
#' @author Joona Lehtomäki <joona.lehtomaki@@gmail.com>
#' 
#' @param id integer or String. catid of a category.
#' @param limit integer. Maximum number of query items returned (default and max=100)
#' @return A list of tag items. Each item has attributes title, count, and wordid
#' 
#' @importFrom httr GET
#' @importFrom httr content
#' @export
#' @examples
#' questions <- latest_questions()
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
  
  url <- paste0(get('categories.url', envir=cacheEnv), '/id/',
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

#' Get all category names (titles).
#'
#' @keywords avoindata, categories
#' @author Joona Lehtomäki <joona.lehtomaki@@gmail.com>
#'
#' @return A character vector of category names
#'
#' @export
#' @examples
#' category.names <- catnames()
catnames <- function() {
  categories <- catinfo()
  return(as.character(categories$title))
}