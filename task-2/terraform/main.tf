terraform {
  backend "s3" {
    bucket = "anjul-terraform-state-12345"
    key    = "task-2/terraform.tfstate"
    region = "us-east-2"
  }
}

provider "aws" {
  region = var.region
}

# Security Group
resource "aws_security_group" "sg" {
  name_prefix = "task-2-sg"
  description = "Allow SSH and HTTP"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
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

# EC2 Instance
resource "aws_instance" "app" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  vpc_security_group_ids = [aws_security_group.sg.id]

  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install -y docker.io docker-compose git
              systemctl start docker
              systemctl enable docker
              usermod -aG docker ubuntu
              EOF

  tags = {
    Name = "task-2-auto-server"
  }
}
