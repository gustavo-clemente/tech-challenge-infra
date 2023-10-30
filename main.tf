terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

module "eks" {
  source = "./modules/eks"
}


module "kms" {
  source = "./modules/kms"
}