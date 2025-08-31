# ------------------------------
# EC2のキーペア
# ------------------------------
resource "aws_key_pair" "keypair" {
  key_name   = "${var.project}-${var.environment}-keypair"
  public_key = file("./src/***.pub")
  tags = {
    Name    = "${var.project}-${var.environment}-keypair"
    Project = var.project
    Env     = var.environment
  }
}

# ------------------------------
# EC2インスタンス
# ------------------------------
resource "aws_instance" "app_server" {
  # LAMP環境をインストールしたEC2イメージを使う
  ami                         = data.aws_ami.app_lamp_img.id
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.public_subnet_1a.id
  associate_public_ip_address = true
  vpc_security_group_ids = [
    aws_security_group.app_sg.id,
    aws_security_group.opmng_sg.id
  ]
  key_name = aws_key_pair.keypair.key_name
  tags = {
    Name = "subnet-1a-ec2"
  }
}

resource "aws_instance" "app_server_1c" {
  ami                         = data.aws_ami.app_lamp_img.id
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.public_subnet_1c.id
  associate_public_ip_address = true
  vpc_security_group_ids = [
    aws_security_group.app_sg.id,
    aws_security_group.opmng_sg.id
  ]
  key_name = aws_key_pair.keypair.key_name
  tags = {
    Name = "subnet-1c-ec2"
  }
}