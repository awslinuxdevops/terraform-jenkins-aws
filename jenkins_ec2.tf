resource "aws_instance" "jenkins" {
  ami                         = "ami-02d26659fd82cf299" # Update to your region AMI
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.public.id
  key_name                    = var.key_name
  security_groups             = [aws_security_group.jenkins_ec2_sg.name]
  user_data                   = file(var.user_data_file)
  associate_public_ip_address = true

  tags = {
    Name = "Jenkins-EC2"
  }
}
