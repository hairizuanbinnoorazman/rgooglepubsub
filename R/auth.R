.pubsubEnv <- new.env(parent = emptyenv())
.pubsubEnv$Token <- NULL

# Set token to environment
set_token <- function(value) {
  .pubsubEnv$Token <- value
  return(value)
}

# Get token from environment
get_token <- function() {
  .pubsubEnv$Token
}

#' Authorize R package to access Google PubSub API
#' @description This is a function to authorize the R package to access the Google Pubsub API.
#' This package does not provide a default credential for testing. In order to test out the functions, you
#' would need to enable the Google Pubsub API and obtain the auth JSON file for this. Authentication for this
#' is done via a service account
#' @importFrom httr oauth_endpoints oauth_service_token oauth_endpoints
#' @importFrom jsonlite fromJSON
#' @param json_service_account_file A Service Account Authentication file location. Do ensure that it is in the JSON format
#' This is obtained from Google API Credentials
#' @export
authorize <- function(json_service_account_file){
  endpoint <- oauth_endpoints("google")
  secrets <- jsonlite::fromJSON(json_service_account_file)
  scope <- "https://www.googleapis.com/auth/cloud-platform https://www.googleapis.com/auth/pubsub"
  token <- oauth_service_token(endpoint, secrets, scope)
  set_token(token)
  return(invisible(token))
}
