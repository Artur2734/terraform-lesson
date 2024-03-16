
data "aws_ssm_parameter" "my_amzn_linux_ami" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}


locals {
  ec2_name_prefix = "asaghatelyan_ec2"
}



data "aws_security_group" "as-sg" {
  name = var.security_group_name
}

resource "aws_security_group" "as-sg" {
  name        = var.security_group_name
  description = var.security_group_description

  vpc_id = var.vpc_id

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
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.security_group_name
  }
}



resource "aws_launch_template" "launch_template" {
  name_prefix = var.launch_template_name
  description = "EC2 launch template generated from terraform"

  network_interfaces {
    device_index                = 0
    associate_public_ip_address = true
    security_groups             = [data.aws_security_group.as-sg.id]
  }

  instance_type = var.instance_type
  key_name      = var.key_pair
  image_id      = data.aws_ssm_parameter.my_amzn_linux_ami.insecure_value


  placement {
    availability_zone = var.availability_zone
  }
}


resource "aws_instance" "ec2_tf" {
  count = 3

  launch_template {
    id      = aws_launch_template.launch_template.id
    version = "$Latest"
  }

  tags = {
    Name = "asaghatelyan_ec2${format("%01d", count.index + 1)}"
  }
}