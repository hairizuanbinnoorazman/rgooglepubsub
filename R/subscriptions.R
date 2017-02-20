#' Acknowledge messages from subscription
#' @param project Name of Google Cloud Project
#' @param subscription Name of the subscription available for consuming messages
#' @param ackIds List of acknowledge IDs to be sent to the Google Pubsub service
#' @importFrom httr POST config accept_json content
#' @export
acknowledge_messages <- function(project, subscription, ackIds){
  # Get URL endpoint
  url <- get_endpoint('pubsub.subscriptions.acknowledge', project, sub = subscription)
  # Get service account credentials
  token <- get_token()
  config <- httr::config(token=token)
  # Prepare the POST params
  params = list(ackIds = list(ackIds))
  result <- httr::POST(url, config = config, accept_json(), body = params, encode = 'json')
  result_content <- content(result)
  return(result_content)
}


#' Create new subscription
#' @param project Name of Google Cloud Project
#' @param subscription Name of the subscription available for consuming messages
#' @param topic The name of the topic from which this subscription is receiving messages.
#' @param pushConfig Named list of key and value pairs that would be used as attributes
#' @param ackDeadlineSeconds This value is the maximum time after a subscriber receives
#' a message before the subscriber should acknowledge the message. It will only take a minimum of
#' 10s and a maximum of 600s
#' @importFrom httr PUT config accept_json content
#' @export
create_subscription <- function(project, subscription, topic, pushConfig = NULL, ackDeadlineSeconds = 10){
  # Get URL endpoint
  url <- get_endpoint('pubsub.subscriptions.create', project, sub = subscription)
  # Get service account credentials
  token <- get_token()
  config <- httr::config(token=token)
  # Prepare the PUT params
  params = list(topic = paste0("projects/", project, "/topics/", topic),
                pushConfig = pushConfig, ackDeadlineSeconds = ackDeadlineSeconds)
  result <- httr::PUT(url, config = config, accept_json(), body = params, encode = 'json')
  result_content <- content(result)
  return(result_content)
}


#' Delete subscriptions
#' @param project Name of Google Cloud Project
#' @param subscription Name of the subscription available for consuming messages
#' @importFrom httr DELETE config accept_json content
#' @export
delete_subscriptions <- function(project, subscription){
  # Get URL endpoint
  url <- get_endpoint('pubsub.subscriptions.delete', project, sub = subscription)
  # Get service account credentials
  token <- get_token()
  config <- httr::config(token=token)
  # Run the delete request
  result <- httr::DELETE(url, config = config, accept_json(), encode = 'json')
  result_content <- content(result)
  return(result_content)
}



#' List Subscriptions available in current Google Pubsub project
#' @param project Name of Google Cloud Project
#' @param pageSize Maximum number of topic names to return.
#' @param pageToken The value returned by the last ListTopicsResponse; indicates that this
#' is a continuation of a prior topics.list call, and that the system should return the
#' next page of data.
#' @importFrom httr GET config accept_json content
#' @export
list_subscriptions <- function(project, pageSize, pageToken){
  # Get URL endpoint
  url <- get_endpoint('pubsub.subscriptions.list', project)
  # Get service account credentials
  token <- get_token()
  config <- httr::config(token=token)
  result <- httr::GET(url, config = config, accept_json(), encode = 'json')
  result_content <- content(result)
  return(result_content)
}


#' Pull messages from a subscription
#' @param project Name of Google Cloud Project
#' @param subscription Name of the subscription available for consuming messages
#' @param returnImmediately A boolean to indicate whether Google Pubsub should return a response to the
#' function immediately or for it to attempt to collect more messages before returning
#' @param maxMessages The maximum number of messages returned for this request. The
#' Pub/Sub system may return fewer than the number specified.
#' @importFrom httr POST config accept_json content
#' @export
pull_messages <- function(project, subscription, returnImmediately, maxMessages){
  # Get URL endpoint
  url <- get_endpoint('pubsub.subscriptions.pull', project, sub = subscription)
  # Get service account credentials
  token <- get_token()
  config <- httr::config(token=token)
  # Prepare the POST params
  params = list(returnImmediately = returnImmediately, max_messages = maxMessages)
  result <- httr::POST(url, config = config, accept_json(), body = params, encode = 'json')
  result_content <- content(result)
  return(result_content)
}

