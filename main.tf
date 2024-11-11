# Запуск модулей

# Создаём проект с пользователем
module "project-with-user" {
  source          = "./modules/os_project_with_user"
  os_project_name = "gh_test_tf_modules"
  os_username     = "gh_test_tf_user"
}

# Создаём виртуалку и всё, что необходимо для её работы
module "vm" {
  source              = "./modules/vm"
  os_region           = "ru-9"
  os_zone             = "ru-9a"
  vm_name             = var.flavor_name
  server_root_disk_gb = ["10"]
  vm_vcpus            = 4
  vm_ram_mb           = 4096
  enable_dhcp         = true

  depends_on = [
    module.project-with-user
  ]
}

# Создаём simple file storage в той же сети, где находится виртуальная машина
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

# S3 нет в провайдере Selectel, поэтому под капотом terracurl

# Создаём S3-ключ для пользователя
module "s3-creds" {
  source           = "./modules/s3/s3-credentials"
  os_user_id       = module.project-with-user.user_id
  os_project_id    = module.project-with-user.project_id
  credentials_name = "github-s3-creds"

  depends_on = [
    module.project-with-user
  ]
}

# Создаём S3-bucket
module "s3-bucket" {
  source          = "./modules/s3/s3-bucket"
  os_account      = var.selectel_domain_name
  os_username     = module.project-with-user.user_name
  os_password     = module.project-with-user.user_password
  os_project_id   = module.project-with-user.project_id
  os_project_name = module.project-with-user.project_name
  s3_bucket_name  = "github-s3-bucket"

  depends_on = [
    module.project-with-user
  ]
}

# Создаём CRaaS
module "craas" {
  source        = "./modules/craas"
  os_project_id = module.project-with-user.project_id
  token_ttl     = "1y"

  depends_on = [
    module.project-with-user
  ]
}

# Аттачим floating IP к виртуалке

# Создаём floating IP
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

# Запрашиваем данные, из которых позже возьмём последнюю версию K8s
data "selectel_mks_kube_versions_v1" "versions" {
  project_id = module.project-with-user.project_id
  region     = "ru-9"
}

# Создаём MKS с CPU и GPU нод-группами
module "mks" {
  source = "./modules/mks/k8s-cluster-standalone"

  cluster_name = "gh-cluster-test"
  kube_version = data.selectel_mks_kube_versions_v1.versions.latest_version

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

  gpu_nodegroups     = 0
  gpu_ng_nodes_count = [1]
  gpu_ng_volume_gb   = [100]
  gpu_ng_volume_type = ["fast"]
  gpu_ng_labels      = [{ "role" : "gpu" }]
  gpu_ng_flavor      = ["3021"]

  nat_subnet_cidr   = "10.222.0.0/16"
  enable_autorepair = false
  network_id        = ""

  depends_on = [
    module.project-with-user
  ]
}
