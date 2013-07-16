options(stringsAsFactors=FALSE)
#' Get all the tags, counts, and wordids.
#'
#' @keywords avoindata, categories
#' @author Joona Lehtomaki <joona.lehtomaki@@gmail.com>
#'
#' @return A DataFrame with each row containg columns title, count, and catid
#'
#' @export
#' @examples
#' categories <- catinfo()
#' @seealso response2df
#' @note Should the results be cached?

catinfo <- function(){
  return(response2df(get('categories.url', envir=urlEnv)))
}

#' Get all category names (titles).
#'
#' @keywords avoindata, categories
#' @author Joona Lehtomaki <joona.lehtomaki@@gmail.com>
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