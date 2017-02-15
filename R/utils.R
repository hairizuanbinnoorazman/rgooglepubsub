#' Generate endpoint for the Google Pubsub API
#' Temporarily available
#' @export
get_endpoint <- function(typeOfEndpoint = "pubsub.topics.list", project = NULL, topic = NULL, sub = NULL){
  url_endpoint <- getOption(typeOfEndpoint)
  if(grepl('{project}', url_endpoint, fixed = TRUE)){
    url_endpoint <- gsub('{project}', project, url_endpoint, fixed = TRUE)
  }
  if(grepl('{topic}', url_endpoint, fixed = TRUE)){
    url_endpoint <- gsub('{topic}', topic, url_endpoint, fixed = TRUE)
  }
  if(grepl('{sub}', url_endpoint, fixed = TRUE)){
    url_endpoint <- gsub('{sub}', sub, url_endpoint, fixed = TRUE)
  }
  return(url_endpoint)
}
