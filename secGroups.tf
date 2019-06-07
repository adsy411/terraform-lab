resource "aws_security_group" "publicsg" {
  description = "Accept traffic from the internet"
  ingress {
    from_port = 80
    protocol = "TCP"
    to_port = 80
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 443
    protocol = "TCP"
    to_port = 443
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = -1
    protocol = "ICMP"
    to_port = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 3306
    protocol = "TCP"
    to_port = 3306
    cidr_blocks = ["${var.cidr_ip}"]
  }
  vpc_id = "${aws_vpc.demo.id}"
  tags {
    Name = "Public_Sg"
  }
}


resource "aws_security_group" "backendsg" {
  description = "Accept traffic from public-sub"
  ingress {
    from_port = 22
    protocol = "tcp"
    to_port = 22
    cidr_blocks = ["${var.cidr_ip}"]
  }
  ingress {
    from_port = 80
    protocol = "tcp"
    to_port = 80
    security_groups = ["${var.sub1_cidr_ip}", "${var.sub3_cidr_ip}"]
  }
  egress {
    from_port = 80
    protocol = "tcp"
    to_port = 80
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 443
    protocol = "tcp"
    to_port = 443
    cidr_blocks = ["0.0.0.0/0"]
  }
  vpc_id = "${aws_vpc.demo.id}"
  tags {
    Name = "Backend_Sg"
  }
}

resource "aws_security_group" "nat" {
  description = "Provide Internet access to db server"
  ingress {
    from_port = 80
    protocol = "tcp"
    to_port = 80
    cidr_blocks = ["${var.sub3_cidr_ip}", "${var.sub2_cidr_ip}"]
  }
  ingress {
    from_port = 443
    protocol = "tcp"
    to_port = 443
    cidr_blocks = ["${var.sub3_cidr_ip}", "${var.sub2_cidr_ip}"]
  }
  ingress {
    from_port = 22
    protocol = "tcp"
    to_port = 22
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = -1
    protocol = "icmp"
    to_port = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 80
    protocol = "tcp"
    to_port = 80
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 443
    protocol = "tcp"
    to_port = 443
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 22
    protocol = "tcp"
    to_port = 22
    cidr_blocks = ["${var.cidr_ip}"]
  }
  egress {
    from_port = -1
    protocol = "icmp"
    to_port = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
  vpc_id = "${aws_vpc.demo.id}"
  tags {
    Name = "Nat_Sg"
  }
}
resource "aws_security_group" "dbsg" {
  description = "Traffic between the differnt secgroups"
  ingress {
    from_port = 3306
    protocol = "tcp"
    to_port = 3306
    security_groups = ["${aws_security_group.publicsg.id}"]
  }
  ingress {
    from_port = 22
    protocol = "tcp"
    to_port = 22
    cidr_blocks = ["${var.cidr_ip}"]
  }
  ingress {
    from_port = -1
    protocol = "icmp"
    to_port = -1
    cidr_blocks = ["${var.cidr_ip}"]
  }
  egress {
    from_port = 80
    protocol = "tcp"
    to_port = 80
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 443
    protocol = "tcp"
    to_port = 443
    cidr_blocks = ["0.0.0.0/0"]
  }
  vpc_id = "${aws_vpc.demo.id}"
  tags {
    Name = "Db_Sg"
  }
}