variable "name_vpc_network" {
  description = "VPC network name"
}

variable "region" {
  description = "Subnet region"
}

variable "zone" {
  description = "Subnet zone"
}

// --------------------- Bastion host --------------------- 
variable "name_subnet_bastion" {
  description = "Name of bastion host subnet"
}

variable "name_bastion" {
  description = "Name of bastion host"
}

variable "tags_bastion_host" {
  description = "Tags for bastion host"
}

variable "IPv4_bastion" {
  description = "IPv4 for basion host"
}

variable "machine_type_bastion_host" {
  description = "Machine type for bastion host"
}

variable "image_bastion_host" {
  // Find image here: https://cloud.google.com/compute/docs/images/os-details
  // Image = Image project/Image family (ex: image = "rocky-linux-cloud/rocky-linux-9")
  description = "Image for bastion host"
}

variable "bash_script_bastion" {
  description = "Bash script file for bastion host"
}

// --------------------- Web server --------------------- 
variable "name_subnet_web_server" {
  description = "Name of web server subnet"
}

variable "name_web_server" {
  description = "Name of web server"
}

variable "tags_web_server" {
  description = "Tags for web server"
}

variable "IPv4_web_server" {
  description = "IPv4 for web server"
}

variable "machine_type_web_server" {
  description = "Machine type for web server"
}

variable "image_web_server" {
  // Find image here: https://cloud.google.com/compute/docs/images/os-details
  // Image = Image project/Image family (ex: image = "rocky-linux-cloud/rocky-linux-9")
  description = "Image for web server"
}

variable "bash_script_web_server" {
  description = "Bash script file for web server"
}
