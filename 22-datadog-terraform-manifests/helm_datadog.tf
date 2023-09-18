
provider "helm" {
  kubernetes {
    host = data.terraform_remote_state.eks.outputs.cluster_endpoint 
    cluster_ca_certificate = base64decode(data.terraform_remote_state.eks.outputs.cluster_certificate_authority_data)
    token = data.aws_eks_cluster_auth.cluster.token
  }
}

resource "helm_release" "datadog_agent" {
  name       = "datadog-agent"
  chart      = "datadog"
  repository = "https://helm.datadoghq.com"
  version    = "3.10.9"
  namespace  = "default"

  set_sensitive {
    name  = "datadog.apiKey"
    value = var.datadog_api_key
  }

  set_sensitive {
    name  = "datadog.appKey"
    value = var.datadog_app_key
  }

  set {
    name  = "datadog.site"
    value = var.datadog_site
  }
}

/*

resource "helm_release" "datadog_agent" {
  name       = "datadog-agent"
  chart      = "datadog"
  repository = "https://helm.datadoghq.com"
  version    = "3.10.9"
  namespace  = kubernetes_namespace.beacon.id

  set_sensitive {
    name  = "datadog.apiKey"
    value = var.datadog_api_key
  }

  set_sensitive {
    name  = "datadog.appKey"
    value = var.datadog_app_key
  }

  set {
    name  = "datadog.site"
    value = var.datadog_site
  }

  set {
    name  = "datadog.logs.enabled"
    value = true
  }

  set {
    name  = "datadog.logs.containerCollectAll"
    value = true
  }

  set {
    name  = "datadog.leaderElection"
    value = true
  }

  set {
    name  = "datadog.collectEvents"
    value = true
  }

  set {
    name  = "clusterAgent.enabled"
    value = true
  }

  set {
    name  = "clusterAgent.metricsProvider.enabled"
    value = true
  }

  set {
    name  = "networkMonitoring.enabled"
    value = true
  }

  set {
    name  = "systemProbe.enableTCPQueueLength"
    value = true
  }

  set {
    name  = "systemProbe.enableOOMKill"
    value = true
  }

  set {
    name  = "securityAgent.runtime.enabled"
    value = true
  }

  set {
    name  = "datadog.hostVolumeMountPropagation"
    value = "HostToContainer"
  }
}
*/