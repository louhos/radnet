#' Convert a standard Unix epoch value to ISO 8601 date format.
#'
#' @keywords dates, time
#' @author Joona Lehtomäki <joona.lehtomaki@@gmail.com>
#'
#' @param epoch integer value for the epoch
#' @return POSIXct object corresponding to the epoch value provided
#'
#' @examples
#' epoch2dtime(1367244015)
#' "2013-04-29 17:00:15 EEST"
#' 
epoch2dtime <- function(epoch) {
  return(as.POSIXct(epoch, origin='1970-01-01T00:00:00Z'))
}