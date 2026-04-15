variable "region" {
  default = "us-east-2"
}

variable "instance_type" {
  default = "t2.large"
}

variable "key_name" {
  description = "EC2 Key Pair Name"
}

variable "ami_id" {
  default = "ami-07062e2a343acc423"
}
