# Jenkins EC2 server

resource "aws_instance" "jenkins_ec2" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = "subnet-02ff8229745029c5f" # pick one subnet
  associate_public_ip_address = true
  security_groups             = [aws_security_group.jenkins_sg.id]
  user_data                   = file("user_data.sh")

  tags = {
    Name = "jenkins-ubuntu-terraform-server"
  }
}

