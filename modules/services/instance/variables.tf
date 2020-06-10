### AWS

variable "ami_id" {
  type = "string"
}

variable "instance_type" {
  type = "string"
  default = "t2.micro"
}

variable "volume_size" {}

variable "subnet_id" {
  type = "string"
}

variable "instance_name" {
  type = "string"
}

variable "key_pair" {}

variable "security_group_id" {}
