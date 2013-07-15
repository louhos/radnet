#' Get all the tags, counts, and wordids.
#'
#' @keywords avoindata, tags
#' @author Joona Lehtomäki <joona.lehtomaki@@gmail.com>
#'
#' @return A list of tag items. Each item has attributes title, count, and wordid
#'
#' @importFrom httr GET
#' @importFrom httr content
#' @export
#' @examples
#' tags <- get_tags()

gettags <- function(){
  return(content(GET(get('tag.url', envir=cacheEnv)), as='parsed'))
}

#' Get latest 10 questions labelled with a given tag.
#'
#' @keywords avoindata, tags
#' @author Joona Lehtomäki <joona.lehtomaki@@gmail.com>
#' 
#' @param name String. Name of the tag used.
#' @param id integer or String. Wordid that can be used alternatively.
#' @return A list of tag items. Each item has attributes title, count, and wordid
#' 
#' @note Name takes precedence over id. If both are provided, id is only tried if name fails.
#' 
#' @importFrom httr GET
#' @importFrom httr content
#' @export
#' @examples
#' tags <- get_tags()

getlatest <- function(name=NULL, ID=NULL) {
  if (is.null(name) && is.null(ID)) {
    stop('Either name or ID must be provided.')
  } else if (!is.null(name)) {
    url <- paste0(get('tag.url', envir=cacheEnv), '/title/', name)
  } else if (is.null(name) && !is.null(ID)) {
    url <- paste0(get('tag.url', envir=cacheEnv), '/id/', ID)
  }
  
  questions <- content(GET(url), as='parsed')
  if (length(questions[[1]]) == 0) {
    stop(paste('Empty response with url:', url))
  } else {
    return(questions)
  }
}

#' Get all tag names (titles).
#'
#' @keywords avoindata, tags
#' @author Joona Lehtomäki <joona.lehtomaki@@gmail.com>
#'
#' @return A character vector of tag names
#'
#' @export
#' @examples
#' tags <- tagnames()
tagnames <- function() {
  tags <- gettags()
  return(sapply(tags[[1]], function(x) {x$title}))
}