#' Search for an IPv4 or IPv6 address
#'
#' @param ip IPv4 or IPv6 address
#' @param api_key see [networksdb_api_key()]
#' @export
ip_info <- function(ip, api_key = networksdb_api_key()) { # ipv6

  httr::GET(
    url = "https://networksdb.io/api/ip-info",
    query = list(
      ip = ip[1],
    ),
    httr::add_headers(`X-Api-Key` = api_key),
    .NETWORKS_DB_UA
  ) -> res

  httr::stop_for_status(res)

  out <- httr::content(res, as = "text", encoding = "UTF-8")

  out <- jsonlite::fromJSON(out)

  out

}