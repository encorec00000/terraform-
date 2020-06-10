### AWS

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "vpc_tenancy" {
  default = "dedicated"
}

variable "vpc_name" {
  default = "tf_vpc"
}

variable "vpc_id" { 
}

variable "subnet_cidr" {
  default = "10.0.1.0/24"
}

variable "subnet_name" {
  default = "tf_subnet"
}

variable "igw_name" {}

variable "route_name" {}

