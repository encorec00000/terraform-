terraform {
  backend "s3" {
    bucket = "terraform-state-demo123"
    key = "Production/services/webserver-cluster.tfstate"
    region = "ap-northeast-1"
    encrypt = true
  }
}

provider "aws" {
  region = "ap-northeast-1"
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"       
}

module "test" {
  source = "../../../modules/services/webserver-cluster"
}

