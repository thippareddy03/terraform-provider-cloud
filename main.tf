module "vpc" {
  source  = "app.terraform.io/Practice-VTR/cloud/provider"
  version = "1.0.1"

  name               = "my_vpc"
  cidr               = "172.31.0.0/16"
  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
