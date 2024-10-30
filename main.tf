module "vpc" {
  source  = "app.terraform.io/Practice-VTR/cloud/provider"
  version = "1.0.1"

  name               = "my_vpc"
  cidr               = "172.31.0.0/16"
  azs                = ["us-east-1a", "us-east-1b", "us-east-1c"]
  private_subnets    = ["172.31.48.0/20"]
  public_subnets     = ["172.31.64.0/20", "172.31.0.0/20"]
  enable_nat_gateway = false
  enable_vpn_gateway = false

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

module "app_service_sg" {
  source = "app.terraform.io/Practice-VTR/cloud/provider"
  version = "1.0.1"

  name        = "app-service"
  description = "Security group for user-service with custom ports open within VPC, and PostgreSQL publicly open"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = ["172.31.48.0/20"]
  ingress_rules       = ["https-443-tcp"]
  ingress_with_cidr_blocks = [
    {
      from_port   = 8080
      to_port     = 8090
      protocol    = "tcp"
      description = "User-service ports"
      cidr_blocks = "172.31.48.0/20"
    },
    {
      rule        = "postgresql-tcp"
      cidr_blocks = "0.0.0.0/0"
    },
  ]
}