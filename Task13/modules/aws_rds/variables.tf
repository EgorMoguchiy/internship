variable "env" {
  default = "default"
}

variable "instance_class" {
  default = "db.t3.micro"
}

variable "allocated_storage" {
  default = 5
}

variable "engine_version" {
  default = "13.7"
}

variable "username" {
  default = "postgres"
}

variable "password" {
  default = "q1w2e3r4t5"
}

variable "private_subnet_id" {}
variable "private_sg_id" {}
