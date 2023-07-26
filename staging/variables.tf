variable "project" {
  description = "Project ID"
  default     = "victus-394017"
}

variable "region" {
  description = "Project region"
  default     = "asia-southeast1"
}

variable "zone" {
  description = "Project zone"
  default     = "asia-southeast1-b"
}

// ---------------------------------------------
variable "name_vpc_network" {
  description = "VPC network name"
  default     = "vpc-network-group2"
}

// Subnet name
variable "name_subnet_bastion" {
  description = "Name of bastion host subnet"
  default     = "bastion-host-subnet"
}

variable "name_subnet_web_server" {
  description = "Name of web server subnet"
  default     = "web-server-subnet"
}

// Subnet range
variable "IPv4_range_web_server" {
  description = "IPv4 range for web server"
  default     = "192.168.1.0/24"
}

variable "IPv4_range_mysql" {
  description = "IPv4 range for MySQL Service by GCP"
  default     = "192.168.2.0"
}

variable "IPv4_range_bastion" {
  description = "IPv4 range for bastion host"
  default     = "192.168.3.0/24"
}

// Instance IPv4
variable "IPv4_web_server" {
  description = "IPv4 for web server"
  default     = "192.168.1.5"
}

variable "IPv4_mysql" {
  description = "IPv4 for MySQL Service instance"
  default     = "192.168.2.5"
}

variable "IPv4_bastion" {
  description = "IPv4 for basion host"
  default     = "192.168.3.5"
}

// ---------------------------------------------

// --------------------- Bastion host --------------------- 
variable "name_bastion" {
  description = "Name of bastion host"
  default     = "bastion-host"
}

variable "tags_bastion_host" {
  description = "Tags for bastion host"
  default     = "bastion-host"
}

variable "machine_type_bastion_host" {
  description = "Machine type for bastion host"
  default     = "e2-medium"
}

variable "image_bastion_host" {
  // Find image here: https://cloud.google.com/compute/docs/images/os-details
  // Image = Image project/Image family (ex: image = "rocky-linux-cloud/rocky-linux-9")
  description = "Image for bastion host"
  default     = "rocky-linux-cloud/rocky-linux-9"
}

variable "bash_script_bastion" {
  description = "Bash script file for bastion host"
  default     = "../script/create-delete-test.sh"
}

// --------------------- Web server --------------------- 
variable "name_web_server" {
  description = "Name of web server"
  default     = "web-server"
}

variable "tags_web_server" {
  description = "Tags for web server"
  default     = "web-server"
}

variable "machine_type_web_server" {
  description = "Machine type for web server"
  default     = "e2-medium"
}

variable "image_web_server" {
  // Find image here: https://cloud.google.com/compute/docs/images/os-details
  // Image = Image project/Image family (ex: image = "rocky-linux-cloud/rocky-linux-9")
  description = "Image for web server"
  default     = "rocky-linux-cloud/rocky-linux-9"
}

variable "bash_script_web_server" {
  description = "Bash script file for web server"
  default     = "../script/install-configure-wp.sh"
}
