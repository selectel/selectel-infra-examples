# Запуск модулей

# Создаем проект с пользователем
# данный модуль создать проект/пользователя и креды для него
module "project-with-user" {
  source          = "./modules/os_project_with_user"
  os_project_name = "gh_test_tf_modules"
  os_username     = "gh_test_tf_user"
}

# Создаём виртуалку и все что необходимо для ее работы
module "vm" {
  source              = "./modules/vm"
  os_region           = "ru-9"
  os_zone             = "ru-9a"
  vm_name             = "test-vm"
  server_root_disk_gb = ["10"]
  vm_vcpus            = 4
  vm_ram_mb           = 4096
  enable_dhcp         = true

  depends_on = [
    module.project-with-user
  ]
}

# Создаём simple file storage в ту же сеть что и виртуальная машина
module "sfs" {
  source               = "./modules/sfs"
  os_availability_zone = "ru-9a"
  sfs_size             = 70
  sfs_volume_type      = "basic"
  os_network_id        = module.vm.nat_net_id
  os_subnet_id         = module.vm.nat_sub_id

  depends_on = [
    module.vm
  ]
}

# S3 нет в провайдере selectel, поэтому под капотом terracurl

# Создаём S3-ключ для пользователя
module "s3-creds" {
  source           = "./modules/s3/s3-credentials"
  os_account       = var.selectel_domain_name
  os_username      = var.selectel_user_admin_user
  os_password      = var.selectel_user_admin_password
  os_user_id       = module.project-with-user.user_id
  os_project_id    = module.project-with-user.project_id
  credentials_name = "gh-s3-cred"

  depends_on = [
    module.project-with-user
  ]
}

# Создаём s3 bucket
module "s3-bucket" {
  source          = "./modules/s3/s3-bucket"
  os_account      = var.selectel_domain_name
  os_username     = module.project-with-user.user_name
  os_password     = module.project-with-user.user_password
  os_project_id   = module.project-with-user.project_id
  os_project_name = module.project-with-user.project_name
  s3_bucket_name  = "s3-gh-test"

  depends_on = [
    module.project-with-user
  ]
}

# Создаем CRaaS
module "craas" {
  source        = "./modules/craas"
  os_project_id = module.project-with-user.project_id
  token_ttl     = "1y"

  depends_on = [
    module.project-with-user
  ]
}

# Приатачим плавающий ip к виртуалке

# создадим floating ip
module "fl_ip" {
  source = "./modules/floatingip"
  region = "ru-9"

  depends_on = [
    module.vm
  ]
}

resource "openstack_networking_floatingip_associate_v2" "association_1" {
  port_id     = module.vm.vm_port_id
  floating_ip = module.fl_ip.floatingip_address
  region      = "ru-9"

  depends_on = [
    module.fl_ip
  ]
}

# Создаем MKS с cpu и gpu нод группами
module "mks" {
  source = "./modules/mks/k8s-cluster-standalone"

  cluster_name = "gh-cluster-test"
  kube_version = "1.29.1" # Здесь важно выбрать доступную версию, может протухнуть

  os_availability_zone = "ru-9a"
  os_region            = "ru-9"
  os_project_id        = module.project-with-user.project_id

  nodegroups     = 1
  ng_nodes_count = [1]
  ng_cpus        = [4]
  ng_ram_mb      = [8192]
  ng_volume_gb   = [100]
  ng_volume_type = ["fast"]
  ng_labels      = [{ "role" : "cpu" }]

  gpu_nodegroups     = 1
  gpu_ng_nodes_count = [1]
  gpu_ng_volume_gb   = [100]
  gpu_ng_volume_type = ["fast"]
  gpu_ng_labels      = [{ "role" : "gpu" }]
  gpu_ng_flavor      = ["3031"]

  nat_subnet_cidr   = "10.222.0.0/16"
  enable_autorepair = false
  network_id        = ""

  depends_on = [
    module.project-with-user
  ]
}
