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
  result <- httr::GET(url, config = config, accept_json(), encode = 'json')
  result_content <- content(result)
  return(result_content)
}


#' Publish a message to the current Google Pubsub project
#' @param project Name of Google Cloud Project
#' @param topic Name of the topic to publish to
#' @param data The message payload. You do not need to encode the message. The function internally will encode
#' your message
#' @param attribute_list Optional attributes for this message. Only accepts a named list
#' @importFrom httr POST config accept_json content
#' @importFrom RCurl base64
#' @export
publish_message <- function(project, topic, data, attribute_list){
  # Get URL endpoint
  url <- get_endpoint('pubsub.topics.publish', project, topic = topic)
  # Get service account credentials
  token <- get_token()
  config <- httr::config(token=token)
  # Prepare the post params
  pubsub_msg <- list(data=as.character(base64(data)), attributes=attribute_list)
  params <- list(messages=list(pubsub_msg))
  result <- httr::POST(url, config = config, accept_json(), body = params, encode = 'json')
  result_content <- content(result)
  return(result_content)
}

