resource "aws_internet_gateway" "demo_igw" {
  vpc_id = "${aws_vpc.demo.id}"
  tags {
    Name = "demoigw"
  }
}