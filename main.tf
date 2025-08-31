provider "aws" {
  profile = "terraform"
  region  = "ap-northeast-1"
}

#-----------------------
# プロジェクト名
#-----------------------
variable "project" {
  type    = string
  default = "terraform-learn"
}

#-----------------------
# 検証環境
#-----------------------
variable "environment" {
  type    = string
  default = "development"
}
