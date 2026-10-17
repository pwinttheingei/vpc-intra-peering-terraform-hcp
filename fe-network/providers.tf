terraform {
  cloud {
    organization = "Pwint_Org1" # HCP Terraform Org Name ပြောင်းပါ
    workspaces {
      name = "fe-network-ws"
    }
  }
  required_providers {
    aws = { source = "hashicorp/aws", version = "~> 5.0" }
  }
}

provider "aws" {
  region = "ap-southeast-1"
}