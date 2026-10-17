terraform {
  cloud {
    organization = "Pwint_Org1"
    workspaces {
      name = "be-security-ws"
    }
  }
  required_providers {
    aws = { source = "hashicorp/aws", version = "~> 5.0" }
  }
}

provider "aws" {
  region = "ap-southeast-1"
}