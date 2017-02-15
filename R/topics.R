#' List Topics available in current Google Pubsub project
#' @param project Name of Google Cloud Project
#' @param pageSize Maximum number of topic names to return.
#' @param pageToken The value returned by the last ListTopicsResponse; indicates that this
#' is a continuation of a prior topics.list call, and that the system should return the
#' next page of data.
#' @importFrom httr GET config accept_json content
#' @export
list_topics <- function(project, pageSize, pageToken){
  # Get URL endpoint
  url <- get_endpoint('pubsub.topics.list', project)
  # Get service account credentials
  token <- get_token()
  config <- httr::config(token=token)
  result <- httr::GET(url, config = config, accept_json())
  result_content <- content(result)
  return(result_content)
}
