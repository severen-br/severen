provider "aws" {
  version = "~> 2.0"
  region  = "us-east-1"
}



resource "aws_instance" "dev" {
  count = 2
  ami = var.amis["us-east-1"]
  instance_type = var.image["image"]
  key_name = var.key
  tags = {
    Name = "LNX-FRT-DEV${count.index}"
  }
  vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}"]
}


resource "aws_instance" "dev5" {
  ami = "ami-026c8acd92718196b"
  instance_type = var.image["image"]
  key_name = "${var.key}"
  tags = {
    Name = "dev05"
  }
  vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}"]
}


resource "aws_db_instance" "default" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = "mydb"
  username             = "foo"
  password             = "foobarbaz"
  parameter_group_name = "default.mysql5.7"
}