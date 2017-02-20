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
