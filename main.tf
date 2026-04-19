provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "ubuntu_server" {
  ami                    = "ami-0d1b5a8c13042c939"   # Ubuntu 24.04 LTS in us-east-2
  instance_type          = "t2.micro"
  key_name               = "OHIO"
  vpc_security_group_ids = ["sg-04d4338bc7e62a46b"]

  tags = {
    Name = "Ubuntu-Server"
  }
}
