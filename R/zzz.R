.onAttach <- function(libname, pkgname) {
  packageStartupMessage("Obtain your own Credentials from Google Cloud Console. For further information, see help(authorize).")
}

.onLoad <- function(libname, pkgname) {
  op <- options()
  op.pubsub <- list(
    # Subscriptions Collection
    pubsub.subscriptions.acknowledge = "https://pubsub.googleapis.com/v1/projects/{project}/subscriptions/{sub}:acknowledge",
    pubsub.subscriptions.create = "https://pubsub.googleapis.com/v1/projects/{project}/subscriptions/{sub}",
    pubsub.subscriptions.delete = "https://pubsub.googleapis.com/v1/projects/{project}/subscriptions/{sub}",
    pubsub.subscriptions.get = "https://pubsub.googleapis.com/v1/projects/{project}/subscriptions/{sub}",
    pubsub.subscriptions.getIamPolicy = "https://pubsub.googleapis.com/v1/projects/{project}:getIamPolicy",
    pubsub.subscriptions.list = "https://pubsub.googleapis.com/v1/projects/{project}/subscriptions",
    pubsub.subscriptions.modifyAckDeadline = "",
    pubsub.subscriptions.modifyPushConfig = "",
    pubsub.subscriptions.pull = "",
    pubsub.subscriptions.setIamPolicy = "",
    pubsub.subscriptions.testIamPermissions = "",

    # Topics Collection
    pubsub.topics.create = "",
    pubsub.topics.delete = "",
    pubsub.topics.get = "",
    pubsub.topics.getIamPolicy = "",
    pubsub.topics.list = "",
    pubsub.topics.publish = "",
    pubsub.topics.setIamPolicy = "",
    pubsub.topics.testIamPermissions = "",

    # Subscriptions in Topics Collection
    pubsub.topic.subscription.list = ""
  )
  toset <- !(names(op.pubsub) %in% names(op))
  if (any(toset)) options(op.pubsub[toset])

  invisible()
}