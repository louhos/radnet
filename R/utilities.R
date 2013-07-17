#' Convert a standard Unix epoch value to ISO 8601 date format.
#'
#' @keywords dates, time
#' @author Joona Lehtomaki <joona.lehtomaki@@gmail.com>
#'
#' @param epoch integer value for the epoch
#' @return POSIXct object corresponding to the epoch value provided
#'
#' @export
#' @examples
#' epoch2dtime(1367244015)
#' "2013-04-29 17:00:15 EEST"
#' 
epoch2dtime <- function(epoch) {
  epoch[epoch == 0] <- NA
  return(as.POSIXct(epoch, origin='1970-01-01T00:00:00Z'))
}

#' Retrieve a repsonse from a specified URL and convert it to a 
#' DataFrame.
#'
#' @keywords dates, time
#' @author Joona Lehtomaki <joona.lehtomaki@@gmail.com>
#'
#' @param url String url 
#' @param tags boolean indicating whether repsonse has tags to be collapsed 
#'    (default: FALSE)
#' @return A DataFrame from the response
#'
#' @importFrom httr GET
#' @importFrom httr content
#' 
#' @seealso radnet_urls()
#' 
response2df <- function(url, tags=FALSE) {
  response.list <- httr::content(httr::GET(url), 
                              as='parsed') 
  if (length(response.list[[1]]) == 0) {
    warning(paste('Empty response with url:', url))
  } else {
    if (tags) {
      for (i in 1:length(response.list[[1]])) {
        tags <- response.list[[1]][[i]]$tags
        if (is.null(tags) || tags == 'NULL') {
          tags <- ''
        }
        response.list[[1]][[i]]$tags <- paste(tags, collapse=', ')
      }
    }
    response.df <- do.call(rbind.data.frame, response.list[[1]])
    rownames(response.df) <- NULL
    return(response.df)
  }
}