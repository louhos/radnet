options(stringsAsFactors=FALSE)
#' Get all the tags, counts, and wordids.
#'
#' @keywords avoindata, tags
#' @author Joona Lehtomaki <joona.lehtomaki@@gmail.com>
#'
#' @return A DataFrame with each row containg columns title, count, and wordid
#'
#' @export
#' @examples
#' tags <- taginfo()
#' @seealso response2df
#' @note Should the results be cached?

taginfo <- function(){
  return(response2df(get('tags.url', envir=urlEnv)))
}

#' Get latest 10 questions labelled with a given tag.
#'
#' @keywords avoindata, tags
#' @author Joona Lehtomaki <joona.lehtomaki@@gmail.com>
#' 
#' @param name String. Name of the tag used.
#' @param id integer or String. Wordid that can be used alternatively.
#' @return A DataFrame of tag items. Each row has attributes title, count, and wordid
#' 
#' @note Name takes precedence over id. If both are provided, id is only tried if name fails.
#' 
#' @importFrom httr GET
#' @importFrom httr content
#' @export
#' @examples
#' tags <- latest_tags('Tampere')

latest_tags <- function(name=NULL, id=NULL) {
  if (is.null(name) && is.null(id)) {
    stop('Either name or ID must be provided.')
  } else if (!is.null(name)) {
    url <- paste0(get('tags.url', envir=urlEnv), '/title/', name)
  } else if (is.null(name) && !is.null(id)) {
    url <- paste0(get('tags.url', envir=urlEnv), '/id/', id)
  }
  
  questions <- response2df(url)
  # Convert the epochs to ISO 8601 date format
  questions$created <- epoch2dtime(questions$created)
  questions$updated <- epoch2dtime(questions$updated)
  return(questions)
}

#' Get all tag names (titles).
#'
#' @keywords avoindata, tags
#' @author Joona Lehtomaki <joona.lehtomaki@@gmail.com>
#'
#' @return A character vector of tag names
#'
#' @export
#' @examples
#' tags <- tagnames()
tagnames <- function() {
  tags <- taginfo()
  return(as.character(tags$title))
}