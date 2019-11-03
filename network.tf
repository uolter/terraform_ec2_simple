
resource "aws_vpc" "foo-vpc" {
  cidr_block = var.vpc_cidr_block
  enable_dns_hostnames = true
  enable_dns_support = true
  
  tags = {
    Name = "foo-vpc"
    Role = "network"
    Env = "DEV"
  }
}


resource "aws_subnet" "subnet-1a" {
  cidr_block = "${cidrsubnet(aws_vpc.foo-vpc.cidr_block, 3, 1)}"
  vpc_id = aws_vpc.foo-vpc.id
  availability_zone = "eu-west-1a"
}

##### Internet gateway #######

resource "aws_internet_gateway" "foo-env-gw" {
  vpc_id = aws_vpc.foo-vpc.id
  
  tags = {
    Name = "foo-env-gw"
    Role = "network"
    Env = "DEV"
  }
}


# Routing #
resource "aws_route_table" "route-table-foo-env" {
    vpc_id = aws_vpc.foo-vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.foo-env-gw.id
    }
    
    tags = {
        Name = "foo-env-route-table"
        Role = "network"
        Env = "DEV"
    }
}

resource "aws_route_table_association" "subnet-association" {
  subnet_id      = aws_subnet.subnet-1a.id
  route_table_id = aws_route_table.route-table-foo-env.id
}