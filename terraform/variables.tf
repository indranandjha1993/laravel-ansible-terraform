variable "aws_region" {
  default = "us-west-2"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "web_subnet_cidr" {
  default = "10.0.0.0/24"
}

variable "web_subnet_az" {
  default = "us-west-2a"
}

variable "allowed_ssh_cidr" {
  default = ["0.0.0.0/0"]
}

variable "ami_id" {
  default = "ami-01234567890abcdef0"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  default = "my_key_pair"
}

variable "min_size" {
  default = 1
}

variable "max_size" {
  default = 5
}

variable "desired_capacity" {
  default = 2
}
