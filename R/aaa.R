httr::user_agent(sprintf(
  "networksdb R package %s; (<https://gitlab.com/hrbrmstr/networksdb>)",
  utils::packageVersion("networksdb")
)) -> .NETWORKS_DB_UA