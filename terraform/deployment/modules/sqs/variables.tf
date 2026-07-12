# SQS Variables


variable "sqs_queue_name" {
  type        = string
  description = "The name of the SQS queue used for event processing"
}

variable "sqs_delay_seconds" {
  type        = number
  description = "The amount of time a message is delayed before becoming processing"
}

variable "sqs_max_message_size" {
  type        = number
  description = "The maximum size in bytes allowed for messages"
}

variable "sqs_message_retention_seconds" {
  type        = number
  description = "The amount of time messages remain available in the queue"
}

variable "sqs_receive_wait_time_seconds" {
  type        = number
  description = "The amount of time SQS waits for messages during long polling requests"
}

variable "sqs_visibility_timeout_seconds" {
  type        = number
  description = "The amount of time a received message remains hidden whilst being processed"
}

variable "sqs_fifo_queue" {
  type        = bool
  description = "Determines whether the SQS queue uses FIFO method for message ordering and delivery"
}

variable "sqs_content_based_deduplication" {
  type        = bool
  description = "Determines whether SQS automatically prevents duplicate messages"
}

variable "sqs_max_receive_count" {
  type        = number
  description = "The number of failed message processing attempts before moving to the dead letter queue"
}


variable "sqs_dead_letter_queue_name" {
  type        = string
  description = "The name of the dead letter queue used to store failed SQS messages"
}

variable "sqs_dead_letter_message_retention_seconds" {
  type        = number
  description = "The amount of time failed messages are retained in the dead letter queue for investigation"
}