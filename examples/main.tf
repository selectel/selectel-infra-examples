# Создаем проект с пользователем
# данный модуль создать проект/пользователя и креды для него
module "project-with-user" {
  source          = "../modules/os_project_with_user"
  os_project_name = "gh_test_multiple_ports"
  os_username     = "gh_test_tf_user"
}

# Создаём виртуалку и все что необходимо для ее работы
module "vm" {
  source              = "../modules/vm"
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

# Приатачим плавающий ip к виртуалке
# создадим floating ip
module "fl_ip1" {
  source = "../modules/floatingip"
  region = "ru-9"

  depends_on = [
    module.vm
  ]
}

resource "openstack_networking_floatingip_associate_v2" "association_1" {
  port_id     = module.vm.vm1_port_id
  floating_ip = module.fl_ip1.floatingip_address
  region      = "ru-9"

  depends_on = [
    module.fl_ip1
  ]
}

module "fl_ip2" {
  source = "../modules/floatingip"
  region = "ru-9"

  depends_on = [
    module.vm
  ]
}

resource "openstack_networking_floatingip_associate_v2" "association_2" {
  port_id     = module.vm.vm2_port_id
  floating_ip = module.fl_ip2.floatingip_address
  region      = "ru-9"

  depends_on = [
    module.fl_ip2
  ]
}
