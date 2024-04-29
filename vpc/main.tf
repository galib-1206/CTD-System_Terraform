resource "aws_vpc" "ctd_vpc" {
  cidr_block       = "10.5.0.0/16"

  tags = {
    environment = "ctd-${var.tag}"
    Name = "${var.tag}-ctd-vpc"
  }
}

resource "aws_subnet" "ctd_subnet1" {
  vpc_id     = aws_vpc.ctd_vpc.id
  cidr_block = "10.5.1.0/24"
  availability_zone= "us-west-2a"
  map_public_ip_on_launch = true

  tags = {
    environment = "ctd-${var.tag}"
    Name = "${var.tag}-ctd-subnet1"
  }

  depends_on = [aws_vpc.ctd_vpc]
}

resource "aws_subnet" "ctd_subnet2" {
  vpc_id     = aws_vpc.ctd_vpc.id
  cidr_block = "10.5.2.0/24"
  availability_zone= "us-west-2b"
  map_public_ip_on_launch = false

  tags = {
    environment = "ctd-${var.tag}"
    Name = "${var.tag}-ctd-subnet2"
  }

  depends_on = [aws_vpc.ctd_vpc]
}

resource "aws_internet_gateway" "ctd_igw" {
  vpc_id = aws_vpc.ctd_vpc.id

  tags = {
    environment = "ctd-${var.tag}"
    Name = "${var.tag}-ctd-igw"
  }

  depends_on = [aws_vpc.ctd_vpc]
}

resource "aws_route_table" "ctd_route_table" {
  vpc_id = aws_vpc.ctd_vpc.id

  tags = {
    environment = "ctd-${var.tag}"
    Name = "${var.tag}-ctd-route-table"
  }

  depends_on = [aws_vpc.ctd_vpc]
}

resource "aws_route_table_association" "route_table_association" {
  subnet_id      = aws_subnet.ctd_subnet1.id
  route_table_id = aws_route_table.ctd_route_table.id

  depends_on = [
    aws_subnet.ctd_subnet1,
    aws_route_table.ctd_route_table
  ]
}


resource "aws_route" "internet_route" {
  route_table_id            = aws_route_table.ctd_route_table.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.ctd_igw.id
  depends_on                = [
    aws_route_table.ctd_route_table,
    aws_internet_gateway.ctd_igw
  ]
}

resource "aws_network_acl" "ctd_acl" {
  vpc_id = aws_vpc.ctd_vpc.id

  tags = {
    environment = "ctd-${var.tag}"
  }
  depends_on = [
    aws_vpc.ctd_vpc
  ]
}




# NACL Ingress rules
resource "aws_network_acl_rule" "http_ingress" {
  rule_number   = 400
  protocol      = "6"
  rule_action   = "allow"
  cidr_block    = "0.0.0.0/0"
  from_port     = 80
  to_port       = 80
  network_acl_id = aws_network_acl.ctd_acl.id

  depends_on = [
    aws_network_acl.ctd_acl
  ]
}

resource "aws_network_acl_rule" "ssh_ingress" {
  rule_number   = 200
  protocol      = "6"
  rule_action   = "allow"
  cidr_block    = "0.0.0.0/0"
  from_port     = 22
  to_port       = 22
  network_acl_id = aws_network_acl.ctd_acl.id
  depends_on = [
    aws_network_acl.ctd_acl
  ]
}


resource "aws_network_acl_rule" "https_ingress" {
  rule_number   = 300
  protocol      = "6"
  rule_action   = "allow"
  cidr_block    = "0.0.0.0/0"
  from_port     = 443
  to_port       = 443
  network_acl_id = aws_network_acl.ctd_acl.id
  depends_on = [
    aws_network_acl.ctd_acl
  ]
}

resource "aws_network_acl_rule" "all_egress" {
  egress = true
  rule_number   = 100
  protocol      = "-1"
  rule_action   = "allow"
  cidr_block    = "0.0.0.0/0"
  from_port     = 0
  to_port       = 0
  network_acl_id = aws_network_acl.ctd_acl.id
  depends_on = [
    aws_network_acl.ctd_acl
  ]
}

resource "aws_security_group" "security_group_1" {
  name        = "ctd-${var.tag}-security-group"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.ctd_vpc.id

  tags = {
    environment = "ctd-${var.tag}"
  }

  depends_on = [
    aws_vpc.ctd_vpc
  ]
}



// security group rules
resource "aws_security_group_rule" "ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = aws_security_group.security_group_1.id
  cidr_blocks       = ["0.0.0.0/0"]
  depends_on = [
    aws_security_group.security_group_1
  ]
}

resource "aws_security_group_rule" "http" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  security_group_id = aws_security_group.security_group_1.id
  cidr_blocks       = ["0.0.0.0/0"]
  depends_on = [
    aws_security_group.security_group_1
  ]
}

resource "aws_security_group_rule" "https" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  security_group_id = aws_security_group.security_group_1.id
  cidr_blocks       = ["0.0.0.0/0"]
  depends_on = [
    aws_security_group.security_group_1
  ]
}


