terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.73.0"
    }
  }
  cloud {

    organization = "Practice-VTR"

    workspaces {
      name = "Dev"
    }
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}
