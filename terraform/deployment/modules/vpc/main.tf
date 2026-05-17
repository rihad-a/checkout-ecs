# Creating a vpc

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

# Creating 2 public and 2 private subnets alongside the relevant route tables

resource "aws_subnet" "public" {
    count = length(var.public_subnets)

  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnets[count.index].cidr_block
  availability_zone = var.public_subnets[count.index].availability_zone
  map_public_ip_on_launch = var.public_subnets[count.index].map_public_ip_on_launch_public
}

resource "aws_subnet" "private" {
    count = length(var.private_subnets)

  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_subnets[count.index].cidr_block
  availability_zone = var.private_subnets[count.index].availability_zone
  map_public_ip_on_launch = var.private_subnets[count.index].map_public_ip_on_launch_private
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "public" {
    count = length(aws_subnet.public)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id
}

resource "aws_route_table_association" "private" {
    count = length(aws_subnet.private)
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private.id
}




