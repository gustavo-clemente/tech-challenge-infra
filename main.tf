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



# resource "kubernetes_namespace" "monitoring_tech_challenge" {
#   metadata {
#     annotations = {
#       name = "monitoring-tech-challenge"
#     }

#     labels = {
#       mylabel = "monitoring-tech-challenge"
#     }

#     name = "monitoring-tech-challenge"
#   }
# }
