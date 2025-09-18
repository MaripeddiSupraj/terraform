resource "google_pubsub_topic" "this" {
  name = var.topic_name

  labels = {
    environment = var.environment
  }
}

resource "google_pubsub_subscription" "this" {
  count = length(var.subscriptions)
  name  = var.subscriptions[count.index]
  topic = google_pubsub_topic.this.name

  labels = {
    environment = var.environment
  }
}
