#' Perform a reverse DNS lookup to find all the domain names pointing to the given IPv4 or IPv6 address
#'
#' @param ip address to lookup
#' @param page pagination
#' @param api_key see [networksdb_api_key()]
#' @export
domains_on_ip <- function(ip, page = 1, api_key = networksdb_api_key()) { # ipv6

  httr::GET(
    url = "https://networksdb.io/api/reverse-dns",
    query = list(
      ip = ip[1],
      page = as.integer(page[1])
    ),
    httr::add_headers(`X-Api-Key` = api_key),
    .NETWORKS_DB_UA
  ) -> res

  httr::stop_for_status(res)

  out <- httr::content(res, as = "text", encoding = "UTF-8")

  out <- jsonlite::fromJSON(out)

  out

}