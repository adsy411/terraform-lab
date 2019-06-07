resource "aws_instance" "web" {
  ami = "${lookup(var.amis, var.region)}"
  instance_type = "t2.nano"
  key_name = "${var.key_name}"
  availability_zone = "${var.zones["zone1a"]}"
  vpc_security_group_ids = ["${aws_security_group.publicsg.id}"]
  subnet_id = "${aws_subnet.subnet-1.id}"
  associate_public_ip_address = true
  source_dest_check = false
  tags {
    Name = "web-server"
  }
}

resource "aws_instance" "Backend" {
  ami = "${lookup(var.amis, var.region)}"
  instance_type = "t2.nano"
  key_name = "${var.key_name}"
  availability_zone = "${var.zones["zone1b"]}"
  vpc_security_group_ids = ["${aws_security_group.backendsg.id}"]
  subnet_id = "${aws_subnet.subnet-2.id}"
  associate_public_ip_address = false
  source_dest_check = false
  tags {
    Name = "Backend-server"
  }
}
resource "aws_instance" "db" {
  ami = "${lookup(var.amis, var.region)}"
  instance_type = "t2.nano"
  key_name = "${var.key_name}"
  availability_zone = "${var.zones["zone1c"]}"
  vpc_security_group_ids = ["${aws_security_group.dbsg.id}"]
  subnet_id = "${aws_subnet.subnet-3.id}"
  associate_public_ip_address = false
  source_dest_check = false
  tags {
    Name = "Database-server"
  }
}


resource "aws_instance" "nat" {
  ami = "${lookup(var.amis, var.region)}"
  instance_type = "t2.nano"
  availability_zone = "${var.zones["zone1a"]}"
  vpc_security_group_ids = ["${aws_security_group.nat.id}"]
  subnet_id = "${aws_subnet.subnet-1.id}"
  associate_public_ip_address = true
  source_dest_check = false
  tags {
    Name = "Nat-server"
  }
}
##allocate elastic Ip to nat
resource "aws_eip" "nat" {
  instance = "${aws_instance.nat.id}"
  vpc = true
}