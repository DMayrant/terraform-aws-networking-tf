locals {
  output_public_subnets = {
    for key in keys(local.public_subnets) : key => {
      subnet_id         = aws_subnet.this[key].id
      availability_zone = aws_subnet.this[key].availability_zone

    }
  }

  output_private_subnets = {
    for key in keys(var.subnet_config) : key => {
      subnet_id         = aws_subnet.this[key].id
      availability_zone = aws_subnet.this[key].availability_zone
    }
  }
}
output "vpc_id" {
  description = "AWS ID from created VPC"
  value       = aws_vpc.this.id
}

output "public_subnets" {
  description = "The ID and the availability zone of the public subnets."
  value       = local.public_subnets

}


output "private_subnets" {
  description = "The ID and the availability zone of the private subnets."
  value       = local.private_subnets

}





