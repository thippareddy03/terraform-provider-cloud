module "vpc" {
  source  = "app.terraform.io/Practice-VTR/cloud/provider"
  version = "1.0.1"

  vpc_info = {
    cidr_block           = "192.168.0.0/16"
    enable_dns_hostnames = true
}
}
