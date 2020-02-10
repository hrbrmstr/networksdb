#' Search for organisations matching a search term.
#'
#' @param query search terms
#' @param country if not `NULL` (the default) a single ISO2C country code
#' @param page page number (the query result set may have multiple pages; the current page number
#'        of the result is a slot in the return value list.)
#' @param api_key see [networksdb_api_key()]
#' @return `list` with `total` (# of results for the search), `page` (the current page number), and
#'         `results` which is a data frame of search results. if `nrow()` of this data frame is >
#'         `total` then there are more pages available.
#' @export
org_search <- function(query, country = NULL, page = 1, api_key = networksdb_api_key()) {

  httr::GET(
    url = "https://networksdb.io/api/org-search",
    query = list(
      search = query[1],
      country = country[1],
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