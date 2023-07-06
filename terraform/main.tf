resource "aws_security_group" "eth-node-sg" {
  name        = "eth-node-sg"
  description = "Allow ports required for Ethereum node"

  ingress {
    from_port   = 30303
    to_port     = 30303
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "eth-node-ec2" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  vpc_security_group_ids = [aws_security_group.eth-node-sg.id]

  key_name = var.ssh_key_name

  root_block_device {
    volume_size = var.volume_size
    volume_type = "gp2"
  }
}

resource "aws_eip" "eth-node-eip" {
  instance           = aws_instance.eth-node-ec2.id
  associate_with_private_ip = aws_instance.eth-node-ec2.private_ip
}

output "public_ip" {
  value = aws_eip.eth-node-eip.public_ip
}
