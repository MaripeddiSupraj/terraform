resource "aws_sns_topic" "this" {
  name              = var.topic_name
  kms_master_key_id = "alias/aws/sns"

  tags = {
    Name        = var.topic_name
    Environment = var.environment
  }
}

resource "aws_sns_topic_subscription" "email" {
  count     = length(var.email_endpoints)
  topic_arn = aws_sns_topic.this.arn
  protocol  = "email"
  endpoint  = var.email_endpoints[count.index]
}
