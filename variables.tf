variable "region" {
  description = "default AWS region for hosting app"
  default = "us-east-1"
}
variable "access_id" {
  description = "AWS access key"
  default = "AKIAY23QNRMEMHJUNG5C"
}

variable "secret_key" {
  description = "AWS secret key"
  default = "y/C0cbBOi3xbBrWaKcifSHbSOLCJkWW3ovROl+aq"
}

variable "cidr_ip" {
  description = "Demo vpc cidr Block"
  default = "10.0.0.0/16"
}

variable "sub1_cidr_ip" {
  description = "AWS subnet1 cidr Block"
  default = "10.0.1.0/24"
}
variable "sub2_cidr_ip" {
  description = "AWS subnet2 cidr Block"
  default = "10.0.11.0/24"
}
variable "sub3_cidr_ip" {
  description = "AWS subnet3 cidr Block"
  default = "10.0.21.0/24"
}

variable "zones" {
  type = "map"
  default = {
    "zone1a" = "us-east-1a"
    "zone1b" = "us-east-1b"
    "zone1c" = "us-east-1c"
  }
}

variable "key_name" {
  description = "Aws ssh key name"
  default = "terraform_verginia"
}
variable "key_path" {
  description = "Security key to ssh EC2 instances"
  default = "../terraform_verginia.pem"
}

variable "amis" {
  type = "map"
  description = "Base images"
  default = {
    "us-east-1" = "ami-020a9a7369c26052b"
    "us-east-2" = "ami-be7753db"
    "us-east1-nat" = "ami-0ede5e18"
  }
}