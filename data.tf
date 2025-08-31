
data "aws_prefix_list" "s3_pl" {
  name = "com.amazonaws.*.s3"
}

# ----------------------------------
# Amazon LinuxのAMI
# ----------------------------------
data "aws_ami" "app" {
  most_recent = true
  owners      = ["self", "amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.8.20250818.0-kernel-6.1-x86_64"]
  }
}

# ----------------------------------
# LAMP環境インストール済みのイメージのAMI
# ----------------------------------
data "aws_ami" "app_lamp_img" {
  most_recent = true
  owners      = ["self", "amazon"]

  filter {
    name   = "name"
    values = ["subnet-1a-ec2-bk"]
  }
}