terraform {
  backend "s3" {
    bucket = "terraform-state-demo123"
    key = "QAT/vpc/module-vpc-test.tfstate"
    region = "ap-northeast-1"
    encrypt = true
  }
}

provider "aws" {
  version = "~> 2.0"  
  region     = "ap-northeast-1"
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
}

module "tf_vpc" {
  source = "../../../modules/vpc"

### VCP配置 ###

vpc_name         = "tf_vpc_test"
vpc_cidr         = "10.0.0.0/16"
vpc_tenancy      = "default"

### subnet配置 ###

subnet_name      = "tf_vpc_subnet"
vpc_id           = "${module.tf_vpc.vpc_id}"
subnet_cidr      = "10.0.1.0/24"

### internet_gw配置 ###

igw_name         = "tf_igw"

### route_table配置 ###

route_name = "tf_route"
}
