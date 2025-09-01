variable "vpc_cidr" {
  type        = string
  description = "The CIDR block for the VPC"
}
variable "vpc_config" {
  type = object({
    cidr_block = string
    name       = string
    az         = string
  })
}
variable "subnet_config" { #make sure to do your mapping "for config in values"
  type = map(object({
    public     = optional(bool, false)
    cidr_block = string

  }))

  validation {
    condition = alltrue([
      for config in values(var.subnet_config) : can(cidrnetmask(config.cidr_block))
    ])
    error_message = "The cidr_block config option must contain a valid CIDR block"
  }

}
variable "vpc_name" {
  type        = string
  description = "The tag name for VPC"
}








