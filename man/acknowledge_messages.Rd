% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/subscriptions.R
\name{acknowledge_messages}
\alias{acknowledge_messages}
\title{Acknowledge messages from subscription}
\usage{
acknowledge_messages(project, subscription, ackIds)
}
\arguments{
\item{project}{Name of Google Cloud Project}

\item{subscription}{Name of the subscription available for consuming messages}

\item{ackIds}{List of acknowledge IDs to be sent to the Google Pubsub service}
}
\description{
Acknowledge messages from subscription
}

