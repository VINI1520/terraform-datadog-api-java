
provider "datadog" {
  api_key = var.datadog_api_key
  app_key = var.datadog_app_key
  api_url = var.datadog_api_url
}

resource "datadog_monitor" "beacon" {
  name               = "Kubernetes Pod Health"
  type               = "metric alert"
  message            = "Kubernetes Pods are not in an optimal health state. Notify: @operator"
  escalation_message = "Please investigate the Kubernetes Pods, @operator"

  query = "max(last_1m):sum:kubernetes.containers.running{short_image:beacon} <= 1"

  monitor_thresholds {
    ok       = 2
    //warning  = 2
    critical = 1
  }

  notify_no_data = true

  tags = ["app:beacon", "env:demo"]
}
