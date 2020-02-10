#' Search for the networks announced by an autonomous system
#'
#' @param asn the autonomous system number
#' @param page results pagination
#' @param api_key see [networksdb_api_key()]
#' @export
asn_nets <- function(asn, page = 1, api_key = networksdb_api_key()) { # ipv6

  httr::GET(
    url = "https://networksdb.io/api/asn-networks",
    query = list(
      asn = asn[1],
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