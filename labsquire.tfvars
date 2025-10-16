aws_region        = "ap-south-1"
vpc_cidr          = "10.20.0.0/16"
public_subnet_cidr= "10.20.1.0/24"
instance_type     = "t2.medium"
key_name          = "VikingCloud"  # Replace with your actual key pair
sg_name           = "jenkins-ec2-sg"
user_data_file    = "user_data.sh"
