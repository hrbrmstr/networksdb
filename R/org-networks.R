#' Search for the public networks owned by an organisation.
#'
#' @param id id of an organisation (i.e. returned by [org_search()])
#' @param api_key see [networksdb_api_key()]
#' @export
org_networks <- function(id, page = 1, api_key = networksdb_api_key()) { # ipv6

  httr::GET(
    url = "https://networksdb.io/api/org-networks",
    query = list(
      id = id[1],
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