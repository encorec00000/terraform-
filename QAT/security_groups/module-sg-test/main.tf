terraform {
  backend "s3" {
    bucket  = "terraform-state-demo123"
    key     = "QAT/security_groups/module-sg-test.tfstate"
    region  = "ap-northeast-1"
    encrypt = true
  }
}

provider "aws" {
  region     = "ap-northeast-1"
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
}

module "tf_sg" {
  source = "../../../modules/security_groups"

### sg配置 ###

security_name         = "tf_sg_test"
description           = "tf_sg_test"
use_vpc_id            = "vpc-02b30ebce41498318"
tag_name              = "tf_sg"

#### inbound ####

inbound_description   = "for test"
inbound_from_port     = 80
inbound_to_port       = 80
inbound_protocol      = "tcp"
inbound_cidr_blocks   = ["0.0.0.0/0"]

#### outbound ####

outbound_description  = "for test"
outbound_from_port    = 0
outbound_to_port      = 0
outbound_protocol     = -1
outbound_cidr_blocks  = ["0.0.0.0/0"]

}  
