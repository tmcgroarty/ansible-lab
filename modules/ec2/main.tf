resource "aws_instance" "ubuntu_server" {
  ami                    = "ami-0d1b5a8c13042c939"
  instance_type          = "t2.micro"
  key_name               = "OHIO"
  subnet_id              = "subnet-0a6338b1259311ef9"
  vpc_security_group_ids = ["sg-0915280fa120808de"]

  user_data = <<-EOF
              #!/bin/bash
              apt-get update -y
              apt-get install -y software-properties-common

              # Add Ansible repository
              add-apt-repository --yes --update ppa:ansible/ansible

              # Install Ansible
              apt-get install -y ansible
              EOF

  tags = {
    Name = "Ubuntu-Ansible-Server"
  }
}
