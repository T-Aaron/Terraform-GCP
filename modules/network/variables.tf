variable "name_vpc_network" {
  description = "VPC network name"
}

variable "region" {
  description = "Subnet region"
}

variable "zone-network" {
  description = "Subnet zone"
}

// Subnet name
variable "name_subnet_bastion" {
  description = "Name of bastion host subnet"
}

variable "name_subnet_web_server" {
  description = "Name of web server subnet"
}

// Subnet range
variable "IPv4_range_web_server" {
  description = "IPv4 range for web server"
}

variable "IPv4_range_mysql" {
  description = "IPv4 range for MySQL Service by GCP"
}

variable "IPv4_range_bastion" {
  description = "IPv4 range for bastion host"
}

// Instance IPv4
variable "IPv4_web_server" {
  description = "IPv4 for web server"
}

variable "IPv4_mysql" {
  description = "IPv4 for MySQL Service instance"
}

variable "IPv4_bastion" {
  description = "IPv4 for basion host"
}

// Network tags
variable "tags_bastion_host" {
  description = "Tags for bastion host"
}

variable "tags_web_server" {
  description = "Tags for web server"
}

variable "name_web_server" {
  description = "Name of web server"
}