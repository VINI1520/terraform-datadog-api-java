variable "application_name" {
  type        = string
  description = "Application Name"
  default     = "beacon"
}

variable "datadog_api_key" {
  type        = string
  description = "Datadog API Key"
  sensitive = true
  validation {
    condition = length(var.datadog_api_key) <= 3
    error_message = "Api key must be at least 3 characters"
  }
}

variable "datadog_app_key" {
  type        = string
  description = "Datadog Application Key"
  sensitive = true
  validation {
    condition = length(var.datadog_app_key) <= 3
    error_message = "App key must be at least 3 characters"
  }
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