# https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/monitor_estimated_charges_with_cloudwatch.html#turning_on_billing_metrics

locals {
  name = "billing-alert"
}

resource "aws_cloudwatch_metric_alarm" "billing_alert" {
  alarm_name          = local.name
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = "EstimatedCharges"
  namespace           = "AWS/Billing"
  period              = 60 * 60 * 6 # sec * min * hours
  statistic           = "Maximum"
  threshold           = 5
  alarm_description   = "Bill is over 5 dollars for 1 minute"
  dimensions = {
    Currency = "USD"
  }
  alarm_actions = [aws_sns_topic.billing_alert.arn]
  ok_actions    = [aws_sns_topic.billing_alert.arn]
  tags          = var.default_tags
}

resource "aws_sns_topic" "billing_alert" {
  name = local.name
  tags = var.default_tags

}

resource "aws_sns_topic_subscription" "user_updates_sqs_target" {
  topic_arn = aws_sns_topic.billing_alert.arn
  protocol  = "sms"
  endpoint  = var.phone_number
}

resource "aws_sns_sms_preferences" "billing_alert" {
  default_sms_type  = "Transactional"
  default_sender_id = "barakbdAWS"
  # monthly_spend_limit = 1 # default
}
