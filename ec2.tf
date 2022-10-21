resource "tls_private_key" "key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
  key_name   = var.key_name
  public_key = tls_private_key.key.public_key_openssh
}

resource "aws_instance" "demo" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public_1.id
  vpc_security_group_ids = [aws_security_group.ec2.id]
  key_name               = aws_key_pair.generated_key.key_name

  tags = {
    Name = "ec2-demo"
  }

  user_data = <<EOF
  #!/bin/sh
  sudo apt-get update
  sudo apt-get install -y mysql-client
  sudo yum install -y https://s3.amazonaws.com/ec2-downloads
  windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm 
  sudo systemctl enable amazon-ssm-agent 
  sudo systemctl start amazon-ssm-agent
  EOF
}
