variable "ami" {
   type        = string
   description = "AMI ID in N. Virginia Region"
   default     = "ami-0c101f26f147fa7fd"
}

variable "instance_type" {
   type        = string
   description = "Instance type"
   default     = "t2.micro"
}

variable "name_tag" {
   type        = string
   description = "Name of the EC2 instance"
   default     = "My EC2 Instance"
}
