variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "ap-south-1"

}

variable "aws_access_key" {
  description = "AWS access key"
  type        = string
  sensitive   = true
}

variable "aws_secret_key" {
  description = "AWS secret key"
  type        = string
  sensitive   = true
}



variable "ami_id" {
  description = "AMI ID for EC2 Instance"
  type        = string
  default     = "ami-02d26659fd82cf299" # Ubuntu Machine

}

variable "instance_type" {
  description = "EC2 Instance type"
  type        = string
  default     = "t2.medium"

}

variable "key_name" {
  description = "Your AWS key pair name"
  type        = string
}
