options(stringsAsFactors=FALSE)
#' Get all the tags, counts, and wordids.
#'
#' @keywords avoindata, tags
#' @author Joona Lehtomäki <joona.lehtomaki@@gmail.com>
#'
#' @return A DataFrame with each row containg columns title, count, and wordid
#'
#' @importFrom httr GET
#' @importFrom httr content
#' @export
#' @examples
#' tags <- taginfo()
#' @note Should the results be cached?

taginfo <- function(){
  tags <- httr::content(httr::GET(get('tags.url', envir=cacheEnv)), 
                        as='parsed') 
  tags <- do.call(rbind.data.frame, tags[[1]])
  rownames(tags) <- NULL
  return(tags)
}

#' Get latest 10 questions labelled with a given tag.
#'
#' @keywords avoindata, tags
#' @author Joona Lehtomäki <joona.lehtomaki@@gmail.com>
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
#' tags <- latest_tags()

latest_tags <- function(name=NULL, id=NULL) {
  if (is.null(name) && is.null(id)) {
    stop('Either name or ID must be provided.')
  } else if (!is.null(name)) {
    url <- paste0(get('tags.url', envir=cacheEnv), '/title/', name)
  } else if (is.null(name) && !is.null(id)) {
    url <- paste0(get('tags.url', envir=cacheEnv), '/id/', id)
  }
  
  questions <- httr::content(httr::GET(url), as='parsed')
  if (length(questions[[1]]) == 0) {
    stop(paste('Empty response with url:', url))
  } else {
    questions <- do.call(rbind.data.frame, questions[[1]])
    rownames(questions) <- NULL
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
  tags <- taginfo()
  return(as.character(tags$title))
}