provider "aws" {
  region = var.aws_region
}

resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
}

resource "aws_security_group" "web" {
  name        = "web"
  description = "Allow HTTP traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.allowed_ssh_cidr
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_subnet" "web" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.web_subnet_cidr
  availability_zone       = var.web_subnet_az
  map_public_ip_on_launch = true
}

resource "aws_elb" "web" {
  name               = "web"
  security_groups    = [aws_security_group.web.id]
  subnets            = [aws_subnet.web.id]
  listener {
    lb_port           = 80
    lb_protocol       = "http"
    instance_port     = 80
    instance_protocol = "http"
  }
}

resource "aws_launch_configuration" "web" {
  image_id      = var.ami_id
  instance_type = var.instance_type

  security_groups = [aws_security_group.web.id]
  key_name        = var.key_name

  user_data = <<-EOF
              #!/bin/bash
              echo "Running Ansible provisioning"
              ansible-playbook -i "localhost," -c local /path/to/ansible/playbook.yml
              EOF
}

resource "aws_autoscaling_group" "web" {
  launch_configuration = aws_launch_configuration.web.name
  availability_zones   = [var.web_subnet_az]
  min_size             = var.min_size
  max_size             = var.max_size
  desired_capacity     = var.desired_capacity
  health_check_type    = "EC2"
  vpc_zone_identifier  = [aws_subnet.web.id]
}

output "elb_dns_name" {
  value = aws_elb.web.dns_name
}
