provider "aws" {
  region = "ap-northeast-1"
}

resource "aws_security_group" "tf_security_group" {
  name        = "${var.security_name}"
  description = "${var.description}"
  vpc_id      = "${var.use_vpc_id}"
  ingress {
    description = "${var.inbound_description}"
    from_port   = "${var.inbound_from_port}"
    to_port     = "${var.inbound_to_port}"
    protocol    = "${var.inbound_protocol}"
    cidr_blocks = "${var.inbound_cidr_blocks}"
  }
  egress {
    description = "${var.outbound_description}"
    from_port   = "${var.outbound_from_port}"
    to_port     = "${var.outbound_to_port}"
    protocol    = "${var.outbound_protocol}"
    cidr_blocks = "${var.outbound_cidr_blocks}"
  }
  tags = {
    Name = "${var.tag_name}"
  }
}
