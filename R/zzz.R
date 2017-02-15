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
    pubsub.subscriptions.modifyAckDeadline = "https://pubsub.googleapis.com/v1/projects/{project}/subscriptions/{sub}:modifyAckDeadline",
    pubsub.subscriptions.modifyPushConfig = "https://pubsub.googleapis.com/v1/projects/{project}/subscriptions/{sub}:modifyPushConfig",
    pubsub.subscriptions.pull = "https://pubsub.googleapis.com/v1/projects/{project}/subscriptions/{sub}:pull",
    pubsub.subscriptions.setIamPolicy = "https://pubsub.googleapis.com/v1/projects/{project}:setIamPolicy",
    pubsub.subscriptions.testIamPermissions = "https://pubsub.googleapis.com/v1/{resource}:testIamPermissions",

    # Topics Collection
    pubsub.topics.create = "https://pubsub.googleapis.com/v1/projects/{project}/topics/{topic}",
    pubsub.topics.delete = "https://pubsub.googleapis.com/v1/projects/{project}/topics/{topic}",
    pubsub.topics.get = "https://pubsub.googleapis.com/v1/projects/{project}/topics/{topic}",
    pubsub.topics.getIamPolicy = "https://pubsub.googleapis.com/v1/{resource}:getIamPolicy",
    pubsub.topics.list = "https://pubsub.googleapis.com/v1/projects/{project}/topics",
    pubsub.topics.publish = "https://pubsub.googleapis.com/v1/projects/{project}/topics/{topic}:publish",
    pubsub.topics.setIamPolicy = "https://pubsub.googleapis.com/v1/{resource}:setIamPolicy",
    pubsub.topics.testIamPermissions = "https://pubsub.googleapis.com/v1/{resource}:testIamPermissions",

    # Subscriptions in Topics Collection
    pubsub.topic.subscription.list = "https://pubsub.googleapis.com/v1/projects/{project}/topics/{topic}/subscriptions"
  )
  toset <- !(names(op.pubsub) %in% names(op))
  if (any(toset)) options(op.pubsub[toset])

  invisible()
}
