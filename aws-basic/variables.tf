variable "aws_region" {
  type        = string
  default     = "eu-north-1"  // Europe (Stockholm)
  description = "Región de AWS"
}

variable "aws_profile" {
  type        = string
  default     = "personal-terraform"
  description = "Perfil de AWS definido en ~/.aws/credentials"
}

variable "vpc_cidr" {
  type        = string
  default     = "10.0.0.0/16"
  description = "CIDR de la VPC"
}


variable "instance_type" {
  type        = string
  default     = "t3.micro"
  description = "Tipo de instancia (free tier) en AWS"
}
