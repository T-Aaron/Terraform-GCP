module "network" {
  source = "../modules/network"

  zone-network           = var.zone
  name_vpc_network       = var.name_vpc_network
  region                 = var.region
  name_subnet_bastion    = var.name_subnet_bastion
  name_subnet_web_server = var.name_subnet_web_server

  IPv4_range_bastion    = var.IPv4_range_bastion
  IPv4_range_web_server = var.IPv4_range_web_server
  IPv4_range_mysql      = var.IPv4_range_mysql

  IPv4_bastion    = var.IPv4_bastion
  IPv4_web_server = var.IPv4_web_server
  IPv4_mysql      = var.IPv4_mysql

  tags_bastion_host = var.tags_bastion_host
  tags_web_server   = var.tags_web_server

  name_web_server = var.name_web_server
}

module "vm_instance" {
  source = "../modules/vm_instance"

  zone             = var.zone
  region           = var.region
  name_vpc_network = var.name_vpc_network

  name_subnet_bastion       = var.name_subnet_bastion
  name_bastion              = var.name_bastion
  tags_bastion_host         = var.tags_bastion_host
  IPv4_bastion              = var.IPv4_bastion
  machine_type_bastion_host = var.machine_type_bastion_host
  image_bastion_host        = var.image_bastion_host
  bash_script_bastion       = var.bash_script_bastion

  name_subnet_web_server  = var.name_subnet_web_server
  name_web_server         = var.name_web_server
  tags_web_server         = var.tags_web_server
  IPv4_web_server         = var.IPv4_web_server
  machine_type_web_server = var.machine_type_web_server
  image_web_server        = var.image_web_server
  bash_script_web_server  = var.bash_script_web_server

  # depends_on = [module.sql_service]
}