
resource "aws_security_group" "ec2-instance-sg" {
    name = "ec2-instance"
    vpc_id = aws_vpc.foo-vpc.id

    tags = {
      Name = "ec2-instance-sg"
      Role = "network"
      Env = "DEV"
  }
}

resource "aws_security_group_rule" "allow_http_in" {
  security_group_id = aws_security_group.ec2-instance-sg.id
  type            = "ingress"
  from_port       = 80
  to_port         = 80
  protocol        = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  description = "Allow http connections"
}

resource "aws_security_group_rule" "allow_all_out" {
  security_group_id = aws_security_group.ec2-instance-sg.id
  type            = "egress"
  from_port       = 0
  to_port         = 0
  protocol        = "-1"
  cidr_blocks = ["0.0.0.0/0"]
  description = "Allow all connections out"
}


