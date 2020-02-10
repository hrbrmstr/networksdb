#' Perform a forward DNS lookup to find all the IPv4 and IPv6 addresses pointed to by a given domain name
#'
#' @param domain domain to lookup
#' @param api_key see [networksdb_api_key()]
#' @export
ips_for_domain <- function(domain, api_key = networksdb_api_key()) { # ipv6

  httr::GET(
    url = "https://networksdb.io/api/dns",
    query = list(
      domain = domain[1],
    ),
    httr::add_headers(`X-Api-Key` = api_key),
    .NETWORKS_DB_UA
  ) -> res

  httr::stop_for_status(res)

  out <- httr::content(res, as = "text", encoding = "UTF-8")

  out <- jsonlite::fromJSON(out)

  out

}