# Creating the SQS queue and dead letter queue

resource "aws_sqs_queue" "checkout_ecs_queue" {
  name                        = var.sqs_queue_name
  delay_seconds               = var.sqs_delay_seconds
  max_message_size            = var.sqs_max_message_size
  message_retention_seconds   = var.sqs_message_retention_seconds
  receive_wait_time_seconds   = var.sqs_receive_wait_time_seconds
  visibility_timeout_seconds  = var.sqs_visibility_timeout_seconds
  fifo_queue                  = var.sqs_fifo_queue
  content_based_deduplication = var.sqs_content_based_deduplication
  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.checkout_ecs_dead_letter_queue.arn
    maxReceiveCount     = var.sqs_max_receive_count
  })
}

resource "aws_sqs_queue" "checkout_ecs_dead_letter_queue" {
  name                       = var.sqs_dead_letter_queue_name
  message_retention_seconds = var.sqs_dead_letter_message_retention_seconds
  fifo_queue                = var.sqs_fifo_queue
  content_based_deduplication = var.sqs_content_based_deduplication
}