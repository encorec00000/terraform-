terraform {
  backend "s3" {
    bucket = "terraform-state-demo123"
    key = "QAT/services/ec2.tfstate"
    region = "ap-northeast-1"
    encrypt = true
  }
}

provider "aws" {
  region     = "ap-northeast-1"
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
}


data "aws_security_group" "bx-sg-test1" {
  filter {
    name = "tag:Name"
    values = ["bx-test1"]
  }
  filter {
    name = "vpc-id"
    values = ["vpc-08b6706467090f98c"]
  }
}

resource "aws_instance" "bx-test1" {
  ami  = "ami-1a15c77b"
  instance_type = "t2.micro"
  subnet_id = "subnet-0953f7439865b4387"
  vpc_security_group_ids = [data.aws_security_group.bx-sg-test1.id]
  key_name = ""
  root_block_device {
    volume_size = 20
  }
  tags = {
    Name = "ec2-test1"
  }
}
