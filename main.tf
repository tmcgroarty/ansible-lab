" {
  region = "us-east-2"
}

resource "aws_instance" "ansible" {
  ami           = "ami-xxxxxxxxxxxxxxxxx"
  instance_type = "t2.micro"

  tags = {
    Name = "Ansible-Server"
  }
}
