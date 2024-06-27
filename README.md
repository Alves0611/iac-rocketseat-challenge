# Terraform Multi-Ambiente

## Estrutura da Infraestrutura

Este projeto configura uma infraestrutura distribuída em três ambientes: dev, staging e prod. Cada ambiente tem suas próprias configurações específicas para atender aos requisitos de desenvolvimento, testes e produção.

## Estrutura dos Arquivos

- `main.tf`: Arquivo principal que integra os módulos VPC, EC2 e Load Balancer.
- `variables.tf`: Define as variáveis usadas no projeto.
- `outputs.tf`: Define os outputs dos recursos.
- `environments/`: Contém as configurações específicas para cada ambiente.
- `modules/`: Contém os módulos reutilizáveis para VPC, EC2 e Load Balancer.

## Implantação

1. Inicialize o Terraform:
   ```sh
   terraform init

2. Planeje a infraestrutura:
   ```sh
   terraform plan -var 'environment=dev'

3. Aplique a infraestrutura:
   ```sh
   terraform apply -var 'environment=dev'

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.6 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.22 |


## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ec2"></a> [ec2](#module\_ec2) | ./modules/ec2 | n/a |
| <a name="module_lb"></a> [lb](#module\_lb) | ./modules/lb | n/a |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | ./modules/vpc | n/a |


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | The environment to deploy (dev, staging, prod) | `string` | `"dev"` | no |
| <a name="input_region"></a> [region](#input\_region) | The AWS region to deploy in | `string` | `"us-east-1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ec2_instance_id"></a> [ec2\_instance\_id](#output\_ec2\_instance\_id) | The ID of the EC2 instance |
| <a name="output_load_balancer_dns"></a> [load\_balancer\_dns](#output\_load\_balancer\_dns) | The DNS name of the load balancer |
| <a name="output_subnet_ids"></a> [subnet\_ids](#output\_subnet\_ids) | The IDs of the subnets |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | The ID of the VPC |
<!-- END_TF_DOCS -->