#' Perform a "mass" reverse DNS lookup to find all the domain names pointing to any IPv4 or IPv6 address in the given network
#'
#' @param ip_start,ip_end,cidr Either use `ip_start` and `ip_end` OR `cidr`;
#' @param page results pagination
#' @param api_key see [networksdb_api_key()]
#' @export
domains_in_network <- function(ip_start, ip_end, cidr, page = 1, api_key = networksdb_api_key()) {

  if (missing(cidr)) {

    if (!all(c(!missing(ip_start)), (!missing(ip_end)))) {
      stop("If `cidr` is missing, both `ip_start` and `ip_end` are required.", call.=FALSE)
    }

    params <- list(
      ip_start = ip_start[1],
      ip_end = ip_end[1]
    )

  } else {

    if (!all(c(missing(ip_start)), (missing(ip_end)))) {
      stop("If `cidr` is present, both `ip_start` and `ip_end` should not be used.", call.=FALSE)
    }

    params <- list(
      cidr = cidr[1]
    )

  }

  params$page <- as.integer(page[1])

  httr::GET(
    url = "https://networksdb.io/api/mass-reverse-dns",
    query = params,
    httr::add_headers(`X-Api-Key` = api_key),
    .NETWORKS_DB_UA
  ) -> res

  httr::stop_for_status(res)

  out <- httr::content(res, as = "text", encoding = "UTF-8")

  out <- jsonlite::fromJSON(out)

  out

}