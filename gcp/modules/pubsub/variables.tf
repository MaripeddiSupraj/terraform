variable "topic_name" {
  description = "Name of the Pub/Sub topic"
  type        = string
}

variable "subscriptions" {
  description = "List of subscription names"
  type        = list(string)
  default     = []
}

variable "environment" {
  description = "Environment name"
  type        = string
}
