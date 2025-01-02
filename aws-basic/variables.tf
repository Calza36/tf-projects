variable "aws_region" {
  type        = string
  default     = "us-east-1"
  description = "Región de AWS"
}

variable "aws_profile" {
  type        = string
  default     = "default"
  description = "Perfil de AWS definido en ~/.aws/credentials"
}

variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "Tipo de instancia (free tier) en AWS"
}
