module "vpc" {
  source  = "app.terraform.io/Practice-VTR/cloud/provider"
  version = "1.0.0"

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