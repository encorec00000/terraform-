terraform {
  backend "s3" {
    bucket = "terraform-state-demo123"
    key = "Production/services/module-ec2-test.tfstate"
    region = "ap-northeast-1"
    encrypt = true
  }
}

provider "aws" {
  region = "ap-northeast-1"
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"       
}

module "tf_instance" {
  source = "../../../modules/services/instance"

### instance設置 ###

  instance_name   = "tf_name"
  ami_id          = "ami-1a15c77b"
  instance_type   = "t2.micro"
  volume_size     = 8
  key_pair        = ""
  subnet_id       = "subnet-000170d8a87d3cf64"
  security_group_id = ["sg-01633b0ed6e002ef1"]
}
