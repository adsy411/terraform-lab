resource "aws_subnet" "subnet-1" {
  cidr_block = "${var.sub1_cidr_ip}"
  availability_zone = "${var.zones["zone1a"]}"
  vpc_id = "${aws_vpc.demo.id}"
  tags {
    Name = "public"
  }
}
resource "aws_subnet" "subnet-2" {
  cidr_block = "${var.sub2_cidr_ip}"
  availability_zone = "${var.zones["zone1b"]}"
  vpc_id = "${aws_vpc.demo.id}"
  tags {
    Name = "backend"
  }
}
resource "aws_subnet" "subnet-3" {
  cidr_block = "${var.sub3_cidr_ip}"
  vpc_id = "${aws_vpc.demo.id}"
  availability_zone = "${var.zones["zone1c"]}"
  tags {
    Name = "db"
  }
}