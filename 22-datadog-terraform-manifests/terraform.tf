terraform {
  required_providers {
    datadog = {
      source  = "datadog/datadog"
      version = "~> 3.20.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.8.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.16.1"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.50.0"
    }

    tfe = {
      source = "hashicorp/tfe"
      version = "~> 0.42.0"
    }

  }
  required_version = ">= 1.1.0"
}

# Adding Backend as S3 for Remote State Storage
  backend "s3" {
    bucket = "terraform-abcd-cluster-api-java"
    key    = "dev/datadog/terraform.tfstate"
    region = "us-east-1"

    # For State Locking
    dynamodb_table = "dev-terraform-datadog-abcd-api-java-state"    
  }

provider "aws" {
  region = "us-east-1"
}
