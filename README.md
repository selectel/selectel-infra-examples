# Selectel infra terraform modules example

[![Test Selectel Terraform modules](https://github.com/selectel/selectel-infra-examples/actions/workflows/modules.yml/badge.svg)](https://github.com/selectel/selectel-infra-examples/actions/workflows/modules.yml)

> Для работы с облачными ресурсами в Selectel через `terraform` будет не лишним ознакомиться с документацией по работе с `terraform providers openstack/selectel` на [офф. странице.](https://docs.selectel.ru/terraform/)

В данном репозитории находятся примеры terraform модулей, используемых для создания инфраструктуры в облаке Selectel.

## Usage

1. Инициализировать terraform backend
```bash
terraform init
```

2. Создать файл `main.tf`,  где описана необходимая инфраструктура (пример ниже - создание `simple file storage`)
```yaml
module "sfs" {
  source               = "modules/sfs"
  os_network_id        = var.nat_network_id
  os_subnet_id         = var.nat_subnet_id
  sfs_size             = var.sfs_size
  sfs_volume_type      = var.sfs_volume_type
  os_availability_zone = var.os_availability_zone
}
```

3. Для проверки и применения настроек необходимо запустить команды `terraform plan/apply`
```bash
terraform plan
terraform apply
```

## Example of usage

В репозитории можно найти пример использования модулей. В корне репозитория созданы `*.tf` файлы, которые можно использовать как пример вызова модулей.

Для их использования достаточно перейти в корень репозитория и инициализоровать terraform:

```bash
terraform init
```

Далее можно скорректировать некоторые параметры в файле `main.tf`, которые передаются в модули, например, объём sfs, имя кластера и другие.

Теперь можно выполнить комадны `terraform plan/apply`, но чтобы terraform знал, где именно ему все это запускать, необходимо указать значения переменных:

- `selectel_domain_name`, ID аккаунта, например, 123123
- `selectel_user_admin_user`, сервисный пользователь с нужными правами 
- `selectel_user_admin_password`, пароль от сервисного пользователя

Если их не указать в переменных окружения или в команде `terraform plan/apply` с помощью параметра `-var`, то будет предложено ввести значения данных переменных с клавиатуры.

Пример команды для запуска `terraform plan/apply` с указанием переменных окружения перед командой:

```bash
TF_VAR_selectel_domain_name=<Selectel аккаунт ID> \
TF_VAR_selectel_user_admin_user=<Имя сервисного пользователя с нужными правами> \
TF_VAR_selectel_user_admin_password=<Пароль от сервисного пользователя> \
terraform plan/apply
```

После успешного выполнения команды `terraform apply` вы должны увидеть в своём аккаунте новый проект, в котором будет запущены все модули (MKS, SFS, vm, CRaaS и др.)

## Repository structure

### Modules

  * [craas](modules/craas) - создание [Container as a Service](https://selectel.ru/services/cloud/container-registry/)
  * [flavor](modules/flavor) - создание flavor (тип инстанса)
  * [floatingip](modules/floatingip) - создание плавающего ip адреса
  * [image_datasource](modules/image_datasource) - считывание айдишника образа
  * [keypair](modules/keypair) - создание ключевой пары для подключения по ssh
  * [mks](modules/mks) - набор модулей для создания [Selectel Managed Kubernetes](https://selectel.ru/services/cloud/kubernetes/)
    * [k8s-cluster](modules/mks/k8s-cluster) - создание master ноды k8s
    * [k8s-cluster-standalone](modules/mks/k8s-cluster-standalone) - создание managed kubernetes кластера
    * [k8s-nodegroup](modules/mks/k8s-nodegroup) - создание compute ноды k8s
    * [k8s-nodegroup-gpu](modules/mks/k8s-nodegroup-gpu) - создание compute ноды с gpu k8s
  * [nat](modules/nat) - создание nat сет
  * [os_project_with_user](modules/os_project_with_user) - создание проекта в облаке selectel
  * [s3](modules/s3) - создание [объектного хранилища s3](https://selectel.ru/services/cloud/storage/)
    * [s3](modules/s3-bucket) - создание s3 бакета
    * [s3](modules/s3-credentioals) - создание s3 параметров авторизации
  * [selectel-token](modules/selectel) - создание токена аккаунта selectel
  * [sfs](modules/sfs) - создание [файлового хранилища](https://selectel.ru/lab/file-storage/)
  * [vm](modules/vm) - создание [виртуального облачного сервера](https://selectel.ru/services/cloud/servers/)
  * [volume](modules/volume) - создание облачного диска
