variable "vpc_id" {
  type = string
  default = "vpc-0799504f6df9624a0"
}

variable "security_group_name" {
    type = string
    default = ""
   }

variable "security_group_description" {
  type = string
}

variable "launch_template_name" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "key_pair" {
  type = string
}

variable "availability_zone" {
  type = string
}