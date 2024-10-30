# Terraform

## Terraform vs Ansible

| Terraform | Ansible |
| --------- | ------- |
| Focus on infra provisioning and management in declarative way | Used for configuration management, applicaiton deployment and automated task using imperative approach |
| Define the desire state and it will create, update and delete resources | Define task and step to execute |

## Terms

- Provider: Plugin that interact with cloud provider
- Resouces: Basic builing block of Terraform configuration represent single piece of infrastructure
- Modules: Collection of multiple resources. A way to group reusable code and easier maintain
- State: A file that track the current state of infrastructure manage by Terraform

## Commands

```
# Basic command
terraform init
terraform fmt
terraform validate
terraform plan -var-file=my-config -out=plan.out
terraform apply plan.out
terraform destroy -auto-approve

# Show state
terraform state list
terraform state show 'module.vpc.aws_vpc.this[0]'
```

## Example
```
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
}

provider "aws" {
  region  = "ap-southeast-1"
}

resource "aws_instance" "example_server" {
  ami           = "ami-04e914639d0cca79a"
  instance_type = "t2.micro"

  tags = {
    Name = "Example "
  }
}
```

## Terraform on Mac M1
- Use `tfenv` to handle different terraform version
- Install: `brew install tfenv`
- Update: `brew update`
- Install the version: `tfenv install 1.9.8`
- Use the version: `tfenv use 1.9.8`
- List: `tfenv list`