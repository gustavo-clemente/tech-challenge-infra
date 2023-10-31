variable "name" {
  description = "Nome da VPC"
  type        = string
  default     = "tech_challenge_vpc"
}

variable "cidr" {
  description = "Bloco CIDR da VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "azs" {
  description = "Zonas de disponibilidade da VPC"
  type        = list(string)
  default     = ["us-west-2a", "us-west-2b"]
}

variable "public_subnets" {
  description = "Bloco CIDR da VPC para subnets públicas"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnets" {
  description = "Bloco CIDR da VPC para subnets privadas"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "database_subnets" {
  description = "Bloco CIDR da VPC para subnets do banco de dados"
  type        = list(string)
  default     = ["10.0.5.0/24", "10.0.6.0/24"]
}

variable "enable_nat_gateway" {
  description = "Defina como true para habilitar o NAT gateway em subnets privadas"
  type        = bool
  default     = true
}

variable "public_subnet_tags" {
  description = "Tags para subnets públicas"
  type        = map(string)
  default     = {
    "kubernetes.io/role/elb" = "1"
    "kubernetes.io/cluster/tech_challenge_cluster" = "shared"
  }
}

variable "private_subnet_tags" {
  description = "Tags para subnets privadas"
  type        = map(string)
  default     = {
    "kubernetes.io/role/internal-elb" = "1"
    "kubernetes.io/cluster/tech_challenge_cluster" = "shared"
  }
}
