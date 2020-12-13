provider "aws" {
    access_key = "AKIAYDSLAPXL5SYD4V6V"
    secret_key = "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"
    region = "us-east-1"
}
#We need to provide teh  secrity group in which instance should have access
resource "aws_instance" "terratest" {
    ami             = "ami-04d29b6f966df1537"
    instance_type   = "t2.micro"
    count           = "1"
    key_name = "virina_key_ec2"
    user_data = file("setupjava.sh")
    vpc_security_group_ids = [aws_security_group.allow_ports.id]
    tags = {
        Name = "EC2-Master"
        
    }
}

resource "aws_instance" "terratest2" {
    ami             = "ami-04d29b6f966df1537"
    instance_type   = "t2.micro"
    count           = "1"
    key_name = "virina_key_ec2"
    vpc_security_group_ids = [aws_security_group.allow_ports.id]
    #user_data = templatefile("user_data.tmpl")
    user_data = file("setupjava.sh")

    tags = {
            Name = "EC2-Slave"
    }
}

#call default vpc 
resource "aws_default_vpc" "default" {
  tags = {
    "Name" = "Default VPC"
  }
  
}

resource "aws_security_group" "allow_ports" {
  name = "allow_ports"
  description = "allow inbound adn out dound traffic"
  vpc_id = "${aws_default_vpc.default.id}"
  tags = {
    Name = "allowport"
  }
  #vpc_id = "vpc-e010079a"

ingress {
  from_port = 0
   to_port = 0
   protocol = -1
   cidr_blocks = ["0.0.0.0/0"]
  }
  # ingress {
  #   from_port = 22
  #   to_port = 22
  #   protocol = "tcp"
  #   cidr_blocks = ["0.0.0.0/0"]
  #   }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

#previous we have configured
# egress {
#     from_port = 0
#     to_port = 65535
#     protocol = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

# resource "aws_instance" "EC2-Terraform2" {
#   ami = "ami-0b99c7725b9484f9e"
#   count         = "1"
#   instance_type = "t2.micro"
#   tags = {
#       Name = "EC2-Terraform2"
#   }