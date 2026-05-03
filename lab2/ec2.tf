resource "aws_instance" "bastion" {
  ami                    = "ami-0c02fb55956c7d316"
  instance_type          = var.instance_type
  subnet_id              = module.network.public_subnet_id
  vpc_security_group_ids = [aws_security_group.bastion_sg.id]

  tags = {
    Name = "bastion"
  }
  provisioner "local-exec" {
  command = "echo ${self.public_ip}"
  }
}

# App (private subnet)
resource "aws_instance" "app" {
  ami                    = "ami-0c02fb55956c7d316"
  instance_type          = var.instance_type
  subnet_id              = module.network.private_subnet_id
  vpc_security_group_ids = [aws_security_group.app_sg.id]

  tags = {
    Name = "app"
  }
}
