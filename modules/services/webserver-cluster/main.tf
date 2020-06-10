provider "aws" {
    region = "ap-northeast-1"
}

resource "aws_instance" "bx-test1" {
  ami  = "ami-1a15c77b"
  instance_type = "t2.micro"
  subnet_id = "subnet-04e2d35f"
  vpc_security_group_ids = ["sg-b2eaa2c1"]
  key_name = ""
  root_block_device {
    volume_size = 20
  }
  tags = {
    Name = "ec2-test1"
  }
}

