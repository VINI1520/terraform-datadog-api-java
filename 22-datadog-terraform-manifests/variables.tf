variable "application_name" {
  type        = string
  description = "Application Name"
  default     = "beacon"
}

variable "datadog_api_key" {
  type        = string
  description = "Datadog API Key"
  sensitive = true
}

variable "datadog_app_key" {
  type        = string
  description = "Datadog Application Key"
  sensitive = true
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