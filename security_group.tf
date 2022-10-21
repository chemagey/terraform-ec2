resource "aws_security_group" "ec2" {
  name        = "sg_ec2"
  description = "Allow RDS outbound traffic"
  vpc_id      = aws_vpc.demo-vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    description = "HTTP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
