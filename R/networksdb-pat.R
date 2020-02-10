#' Get or set NetworksDB Personal Access Token
#'
#' @param force force setting a new NetworksDB API Key
#' @return atomic character vector containing the NetworksDB API key
#' @references <https://networksdb.io/api/order/free>
#' @export
networksdb_api_key <- function(force = FALSE) {

  pat <- Sys.getenv('NETWORKS_DB_API_KEY')
  if (!identical(pat, "") && !force) {
    return(pat)
  }

  if (!interactive()) {
    stop("Please set env var NETWORKS_DB_API_KEY to your NetworksDB API Key",
         call. = FALSE)
  }

  message("Couldn't find env var NETWORKS_DB_API_KEY See ?networksdb_api_key for more details.")
  message("Please enter your NetworksDB API key and press enter:")
  pat <- readline(": ")

  if (identical(pat, "")) {
    stop("NetworksDB API key entry failed", call. = FALSE)
  }

  message("Updating NETWORKS_DB_API_KEY env var")
  Sys.setenv(NETWORKS_DB_API_KEY = pat)

  pat

}