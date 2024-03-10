
provider "aws" {
  region = "ap-south-1"
}

# Security group start here

resource "aws_security_group" "allow_SG" {
  name        = "allow_SG"
  description = "ssh"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
# Security group end here

resource "aws_instance" "example" {
  ami                    = "ami-03bb6d83c60fc5f7c"
  instance_type          = "t2.micro"
  security_groups        = [aws_security_group.allow_SG.name]
  user_data              = file("docker.sh")
  tags = {
    Name = "docker"
  }
}
