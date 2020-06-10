provider "aws" {
  region = "ap-northeast-1"
}

resource "aws_vpc" "tf_vpc" {
  cidr_block       = "${var.vpc_cidr}"
  instance_tenancy = "${var.vpc_tenancy}"
  tags = {
    Name = "${var.vpc_name}"
  }
}

resource "aws_subnet" "tf_subnet" {
  vpc_id     = "${var.vpc_id}"
  cidr_block = "${var.subnet_cidr}"
  tags = {
    Name = "${var.subnet_name}"
  }
  depends_on = [aws_vpc.tf_vpc]
}

resource "aws_internet_gateway" "tf_igw" {
  vpc_id = "${aws_vpc.tf_vpc.id}"
  tags = {
    Name = "${var.igw_name}"
  }
  depends_on = [aws_subnet.tf_subnet]
}

resource "aws_route_table" "tf_route" {
  vpc_id = "${aws_vpc.tf_vpc.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.tf_igw.id}"
  }
  tags = {
    Name = "${var.route_name}"
  }	  
  depends_on = [aws_internet_gateway.tf_igw]
}
