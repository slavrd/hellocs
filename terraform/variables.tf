variable "access_key" {
  default = ""
}
variable "secret_key" {
  default = ""
}

variable "aws_cred_file_path" {
  default = ""
}


variable "region" {}
variable "ec2-key-pair-name" {}

variable "instance_type" {}

variable "vpc_sg_ids" {
  type    = "list"
  default = []
}

variable "hellocs_version" {
  default = "v0.1"
}

variable "ssh-private-key-path" {}
