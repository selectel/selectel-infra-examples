# Selectel Terraform Modules Example

[![Test Selectel Terraform modules](https://github.com/selectel/selectel-infra-examples/actions/workflows/modules.yml/badge.svg)](https://github.com/selectel/selectel-infra-examples/actions/workflows/modules.yml)

Перед началом работы с облачными ресурсами Selectel через Terraform рекомендуем ознакомиться с [документацией по провайдеру Selectel/OpenStack](https://docs.selectel.ru/terraform/). 

В [данном репозитории](https://github.com/selectel/selectel-infra-examples) находятся примеры Terraform модулей, используемых для создания инфраструктуры в облаке Selectel.

## Usage

1. Перед использованием проверьте версию Terraform, данный репозиторий имеет ограничение на использование, по-причине хранения стейта в S3.

```bash
terraform {
  backend "s3" {}
  required_version = ">= 1.0.0, <= 1.5.7"
}
```

подробнее о проблеме можно ознакомиться на офф. странице [тут](https://developer.hashicorp.com/terraform/language/upgrade-guides). 

2. Инициализировать Terraform Backend

```bash
terraform init
```

3. Создать файл `main.tf`, где описана необходимая инфраструктура (пример ниже - создание `Simple File Storage`)

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

4. Для проверки и применения настроек необходимо запустить команды `terraform plan/apply`


```bash
terraform plan
terraform apply
```

## Example of usage

В репозитории можно найти пример использования модулей. В корне репозитория созданы `*.tf` файлы, которые можно использовать как пример вызова модулей.

Для их использования достаточно перейти в корень репозитория и инициализировать Terraform:

```bash
terraform init
```

Далее можно скорректировать некоторые параметры в файле `main.tf`, которые передаются в модули, например, объём SFS, имя кластера и другие.

Затем необходимо задать переменные, в которых будут содержаться данные от аккаунта Selectel, в котором будет развёрнута инфраструктура:

- `selectel_domain_name`, ID аккаунта, например, 123123
- `selectel_user_admin_user`, сервисный пользователь с нужными правами 
- `selectel_user_admin_password`, пароль от сервисного пользователя

Переменные можно задать несколькими способами:

- В качестве переменных окружения (для этого нужно добавить перед названием переменной `TF_VAR_`):

```bash
export TF_VAR_selectel_domain_name=123123
export TF_VAR_selectel_user_admin_user=foo
export TF_VAR_selectel_user_admin_password=bar
terraform plan/apply
```
- Ввести вместе с командой `terraform plan/apply` с помощью параметра `-var`:

```bash
terraform plan/apply \
-var="selectel_domain_name=123123" \
-var="selectel_user_admin_user=foo" \
-var="selectel_user_admin_password=bar"
```

- Ввести с клавиатуры, если переменные не были заданы любым другим способом

После успешного выполнения команды `terraform apply` вы должны увидеть в своём аккаунте новый проект, в котором будут запущены все модули (MKS, SFS, vm, CRaaS и др.)

## Repository structure

### Modules

  * [craas](modules/craas) - создание [Container as a Service](https://selectel.ru/services/cloud/container-registry/)
  * [flavor](modules/flavor) - создание flavor (тип инстанса)
  * [floatingip](modules/floatingip) - создание плавающего ip адреса
  * [image_datasource](modules/image_datasource) - считывание айдишника образа
  * [keypair](modules/keypair) - создание ключевой пары для подключения по SSH
  * [mks](modules/mks) - набор модулей для создания [Selectel Managed Kubernetes](https://selectel.ru/services/cloud/kubernetes/)
    * [k8s-cluster](modules/mks/k8s-cluster) - создание master ноды k8s
    * [k8s-cluster-standalone](modules/mks/k8s-cluster-standalone) - создание managed kubernetes кластера
    * [k8s-nodegroup](modules/mks/k8s-nodegroup) - создание compute ноды k8s
    * [k8s-nodegroup-gpu](modules/mks/k8s-nodegroup-gpu) - создание compute ноды с GPU k8s
  * [nat](modules/nat) - создание nat сети
  * [network](modules/network) - создание локальной сети
  * [os_project_with_user](modules/os_project_with_user) - создание проекта в облаке Selectel
  * [s3](modules/s3) - создание [объектного хранилища s3](https://selectel.ru/services/cloud/storage/)
    * [s3-bucket](modules/s3-bucket) - создание s3 бакета
    * [s3-credentials](modules/s3-credentioals) - создание s3 параметров авторизации
  * [selectel-token](modules/selectel) - создание токена аккаунта Selectel
  * [sfs](modules/sfs) - создание [файлового хранилища](https://selectel.ru/lab/file-storage/)
  * [vm](modules/vm) - создание [виртуального облачного сервера](https://selectel.ru/services/cloud/servers/)
  * [volume](modules/volume) - создание облачного диска
