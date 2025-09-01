locals {
    project_name = "17-local-modules"
}

data "aws_ami" "ubuntu" { # external Data source  
  most_recent = true
  owners      = ["099720109477"] # Owners is Canonical 
  # place Region you're fetching AMI data from here

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-*-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

}
resource "aws_instance" "from_list" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  subnet_id     = module.vpc.private_subnets["subnet_1"].subnet_id # reference the first public subnet created in the VPC module
  tags = {
    name    = local.project_name
    project = local.project_name
  }
}
