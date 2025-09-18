output "topic_name" {
  description = "Name of the Pub/Sub topic"
  value       = google_pubsub_topic.this.name
}

output "topic_id" {
  description = "ID of the Pub/Sub topic"
  value       = google_pubsub_topic.this.id
}
