terraform {
  backend "s3" {
    bucket  = "terraform-state-demo123"
    key     = "QAT/security_groups/normal-sg.tfstate"
    region  = "ap-northeast-1"
    encrypt = true
  }
}

provider "aws" {
  region     = "ap-northeast-1"
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
}

resource "aws_security_group" "bx-sg-test1" {
  name = "bx-sg-test1"
  description = "test"
  vpc_id = "vpc-624d4805"
  
  ingress {
   #description     = ""
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  egress {
   #description     = ""
    from_port       = 0
    to_port         = 0
    protocol        = "-1"  
   #protocol -1參數等於all
    cidr_blocks     = ["0.0.0.0/0"]
  }
  
  tags = {
    Name = "bx-test1"
  }
}
