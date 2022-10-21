resource "aws_vpc" "demo-vpc" {
  cidr_block                       = var.cidr
  enable_dns_hostnames             = var.enable_dns_hostnames
  enable_dns_support               = var.enable_dns_support
  assign_generated_ipv6_cidr_block = false
  enable_classiclink               = false
  enable_classiclink_dns_support   = false
  instance_tenancy                 = "default"

  tags = {
    Name = var.vpc_tags
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.demo-vpc.id

  tags = {
    Name = "internet-gateway-demo"
  }
}

resource "aws_subnet" "public_1" {
  vpc_id                  = aws_vpc.demo-vpc.id
  map_public_ip_on_launch = true
  cidr_block              = "10.0.1.0/24"

  tags = {
    Name = "public_1-demo"
  }
}

resource "aws_route_table" "route-public" {
  vpc_id = aws_vpc.demo-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "public-route-table-demo"
  }
}

resource "aws_route_table_association" "public_1" {
  subnet_id      = aws_subnet.public_1.id
  route_table_id = aws_route_table.route-public.id
}
