variable "region" {
  description = "AWS Region"
  type        = string
  default     = "ap-south-1"

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
