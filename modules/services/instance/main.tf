provider "aws" {
    region = "ap-northeast-1"
}

resource "aws_instance" "instance" {
  ami                    = "${var.ami_id}"
  instance_type          = "${var.instance_type}"
  subnet_id              = "${var.subnet_id}"
  key_name               = "${var.key_pair}"
  vpc_security_group_ids = "${var.security_group_id}"
  root_block_device {
    volume_size          = "${var.volume_size}"
  }
  tags = {
    Name                 = "${var.instance_name}"
  }
}

