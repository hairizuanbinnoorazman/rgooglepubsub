% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/auth.R
\name{authorize}
\alias{authorize}
\title{Authorize R package to access Google PubSub API}
\usage{
authorize(json_service_account_file)
}
\arguments{
\item{json_service_account_file}{A Service Account Authentication file location. Do ensure that it is in the JSON format
This is obtained from Google API Credentials}
}
\description{
This is a function to authorize the R package to access the Google Pubsub API.
This package does not provide a default credential for testing. In order to test out the functions, you
would need to enable the Google Pubsub API and obtain the auth JSON file for this. Authentication for this
is done via a service account
}

