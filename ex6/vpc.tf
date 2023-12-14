resource "aws_vpc" "TestVPC" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  tags = {
    Name = "Test-VPC"
  }
}

resource "aws_subnet" "TestSubnet-PUB-1" {
  vpc_id                  = aws_vpc.TestVPC.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.AvailabilityZoneCentrala
  tags = {
    Name = "Test-PUB-1"
  }
}

resource "aws_subnet" "TestSubnet-PUB-2" {
  vpc_id                  = aws_vpc.TestVPC.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.AvailabilityZoneCentralb
  tags = {
    Name = "Test-PUB-2"
  }
}

resource "aws_subnet" "TestSubnet-PUB-3" {
  vpc_id                  = aws_vpc.TestVPC.id
  cidr_block              = "10.0.3.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.AvailabilityZoneCentralc
  tags = {
    Name = "Test-PUB-3"
  }
}

resource "aws_subnet" "TestSubnet-Priv-1" {
  vpc_id                  = aws_vpc.TestVPC.id
  cidr_block              = "10.0.4.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.AvailabilityZoneCentrala
  tags = {
    Name = "Test-Priv-1"
  }
}

resource "aws_subnet" "TestSubnet-Priv-2" {
  vpc_id                  = aws_vpc.TestVPC.id
  cidr_block              = "10.0.5.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.AvailabilityZoneCentralb
  tags = {
    Name = "Test-Priv-2"
  }
}

resource "aws_subnet" "TestSubnet-Priv-3" {
  vpc_id                  = aws_vpc.TestVPC.id
  cidr_block              = "10.0.6.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.AvailabilityZoneCentralc
  tags = {
    Name = "Test-Priv-3"
  }
}

resource "aws_internet_gateway" "Test-IGW" {
  vpc_id = aws_vpc.TestVPC.id

  tags = {
    Name = "IGW"
  }
}

resource "aws_route_table" "test-PUB-RT" {
  vpc_id = aws_vpc.TestVPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.Test-IGW.id
  }
}

resource "aws_route_table_association" "PUB-1-a" {
  subnet_id      = aws_subnet.TestSubnet-PUB-1.id
  route_table_id = aws_route_table.test-PUB-RT.id
}

resource "aws_route_table_association" "PUB-2-b" {
  subnet_id      = aws_subnet.TestSubnet-PUB-2.id
  route_table_id = aws_route_table.test-PUB-RT.id
}

resource "aws_route_table_association" "PUB-3-c" {
  subnet_id      = aws_subnet.TestSubnet-PUB-3.id
  route_table_id = aws_route_table.test-PUB-RT.id
}
