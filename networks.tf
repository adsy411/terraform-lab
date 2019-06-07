resource "aws_vpc" "demo" {
  cidr_block = "${var.cidr_ip}"
  enable_dns_hostnames = true
  tags {
    Name = "Demo"
  }
}