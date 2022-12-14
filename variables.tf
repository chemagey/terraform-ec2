variable "region" {
  type    = string
  default = "eu-central-1"
}
variable "ami_id" {
  type    = string
  default = "ami-070b208e993b59cea"
}
variable "instance_type" {
  type    = string
  default = "t2.micro"
}
variable "key_name" {
  type    = string
  default = "ec2-demo"
}
variable "cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}
variable "enable_dns_hostnames" {
  description = "Enable DNS hostnames in the VPC"
  type        = bool
  default     = true
}
variable "enable_dns_support" {
  description = "Enable DNS support in the VPC"
  type        = bool
  default     = true
}
variable "vpc_tags" {
  type    = string
  default = "vpc-custom-demo"
}
