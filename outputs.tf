output "jenkins_public_ip" {
  description = "Jenkins Public IP"
  value       = aws_instance.jenkins_ec2.public_ip
}