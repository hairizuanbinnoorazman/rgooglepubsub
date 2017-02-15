.onAttach <- function(libname, pkgname) {
  packageStartupMessage("Obtain your own Credentials from Google Cloud Console. For further information, see help(authorize).")
}

.onLoad <- function(libname, pkgname) {
  op <- options()
  op.pubsub <- list(
    # Subscriptions Collection
    pubsub.subscriptions.acknowledge = "",
    pubsub.subscriptions.create = "",
    pubsub.subscriptions.delete = "",
    pubsub.subscriptions.get = "",
    pubsub.subscriptions.getIamPolicy = "",
    pubsub.subscriptions.list = "",
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
  toset <- !(names(op.drive) %in% names(op))
  if (any(toset)) options(op.pubsub[toset])

  invisible()
}
