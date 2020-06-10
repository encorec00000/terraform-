### AWS

variable "security_name" {
  default = "tf_sg"
}

variable "description" {
  default = "tf_description"
}

variable "use_vpc_id" {
  default = "tf_vpc"
}

variable "inbound_description" {
  default = "tf_sg_inbound"
}

variable "inbound_from_port" {}

variable "inbound_protocol" {
  type    = "string"
}

variable "inbound_to_port" {}

variable "inbound_cidr_blocks" {}

variable "outbound_description" {
  default = "tf_sg_outbound"
}

variable "outbound_from_port" {}

variable "outbound_protocol" {
  default = "-1"
}

variable "outbound_to_port" {}

variable "outbound_cidr_blocks" {}

variable "tag_name" {
  default = "tf_sg_name"
}
