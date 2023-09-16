variable "application_name" {
  type        = string
  description = "Application Name"
  default     = "beacon"
}

variable "datadog_api_key" {
  type        = string
  description = "Datadog API Key"
  sensitive = true
  default = "82925e1aab007c527130cfbf370566cc"
}

variable "datadog_app_key" {
  type        = string
  description = "Datadog Application Key"
  sensitive = true
  default = "8f0ca4bc6ad08b6e176d22dbe270bace303953e6"
}

variable "datadog_site" {
  type        = string
  description = "Datadog Site Parameter"
  default     = "datadoghq.com"
}

variable "datadog_api_url" {
  type        = string
  description = "Datadog API URL"
  default     = "https://api.datadoghq.com"
}