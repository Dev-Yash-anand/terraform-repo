variable "cidr-block" {
  description = "cidr block for vpc and subnet"
  type = list(string)
}


resource "aws_vpc" "vpcs" {
   cidr_block = var.cidr-block[0]
   tags ={
    Name = "myVpc"
  }
}

resource "aws_subnet" "vpc-subnet" {
  vpc_id = aws_vpc.vpcs.id
  cidr_block = var.cidr-block[1]
  availability_zone = "us-east-2a"
}

resource "aws_instance" "ec2" {
   ami = "ami-08333bccc35d71140"
   instance_type = "t2.micro"
   tags = {
    Name = "hello"
  }
}


output "main" {
   value = aws_vpc.vpcs.id
} 

output "main2" {
   value = aws_subnet.vpc-subnet.id
}
