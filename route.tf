resource "aws_route_table" "public_rt" {
  vpc_id = "${aws_vpc.demo.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.demo_igw.id}"
  }
  tags {
    Name = "public_rt"
  }
}
resource "aws_route_table_association" "public-rt-asso" {
  route_table_id = "${aws_route_table.public_rt.id}"
  subnet_id = "${aws_subnet.subnet-1.id}"
}
resource "aws_route_table" "backend_rt" {
  vpc_id = "${aws_vpc.demo.id}"
  route {
    cidr_block = "0.0.0.0/0"
    instance_id = "${aws_instance.nat.id}"
  }
  tags {
    Name = "backend_rt"
  }
}
resource "aws_route_table_association" "backend_rt_asso" {
  route_table_id = "${aws_route_table.backend_rt.id}"
  subnet_id = "${aws_subnet.subnet-2.id}"
}
resource "aws_route_table" "db-rt" {
  vpc_id = "${aws_vpc.demo.id}"
  route {
    cidr_block = "0.0.0.0/0"
    instance_id = "${aws_instance.nat.id}"
  }
  tags {
    Name = "databae-rt"
  }
}
resource "aws_route_table_association" "db-rt-asso" {
  route_table_id = "${aws_route_table.db-rt.id}"
  subnet_id = "${aws_subnet.subnet-3.id}"
}
