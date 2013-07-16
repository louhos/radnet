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
  return(as.POSIXct(epoch, origin='1970-01-01T00:00:00Z'))
}

#' Retrieve a repsonse from a specified URL and convert it to a 
#' DataFrame.
#'
#' @keywords dates, time
#' @author Joona Lehtomaki <joona.lehtomaki@@gmail.com>
#'
#' @param url String url 
#' @return A DataFrame from the response
#'
#' @importFrom httr GET
#' @importFrom httr content
#' 
#' @seealso radnet_urls()
#' 
response2df <- function(url) {
  response.list <- httr::content(httr::GET(url), 
                              as='parsed') 
  if (length(response.list[[1]]) == 0) {
    stop(paste('Empty response with url:', url))
  } else {
    response.df <- do.call(rbind.data.frame, response.list[[1]])
    rownames(response.df) <- NULL
    return(response.df)
  }
}