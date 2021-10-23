provider "aws" {
    version = "~> 2.0"
    region  = "us-east-1"
}

resource "aws_vpc" "main" { 
  cidr_block = "10.5.0.0/16"

  tags = {
      Name = "tuts vpc"
  }
}

resource "aws_subnet" "web" {
    vpc_id = aws_vpc.main.id
    cidr_block = "10.5.0.0/16"

    tags = {
        Name = "web-subnet"
    }
}

resource "aws_instance" "foobar" {
    ami = "ami-09e67e426f25ce0d7"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.web.id
    tags = {
        Name = "example"
        foo  = "bar"
    }
}
