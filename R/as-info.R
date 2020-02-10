#' Search for an autonomous system
#'
#' @param asn the autonomous system number
#' @param api_key see [networksdb_api_key()]
#' @export
asn_info <- function(asn, api_key = networksdb_api_key()) { # ipv6

  httr::GET(
    url = "https://networksdb.io/api/asn-info",
    query = list(
      asn = asn[1],
    ),
    httr::add_headers(`X-Api-Key` = api_key),
    .NETWORKS_DB_UA
  ) -> res

  httr::stop_for_status(res)

  out <- httr::content(res, as = "text", encoding = "UTF-8")

  out <- jsonlite::fromJSON(out)

  out

}