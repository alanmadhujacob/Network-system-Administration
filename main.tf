provider "aws" {
  region = "eu-west-1" 
}

resource "aws_security_group" "my_web_server_sg" {
  name        = "allow_web_traffic"
  description = "Allow SSH and HTTP traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "my_assignment" {
  ami                    = "ami-03446a3af42c5e74e"
  instance_type          = "t3.micro"
  key_name               = "my_assignment" 
  vpc_security_group_ids = [aws_security_group.my_web_server_sg.id]

  tags = {
    Name = "B9IS121-Automation-Server"
  }
}

output "server_public_ip" {
  value = aws_instance.my_assignment.public_ip
}