# Terraform

## Terraform vs Ansible

| Terraform | Ansible |
| --------- | ------- |
| Focus on infra provisioning and management in declarative way | Used for configuration management, applicaiton deployment and automated task using imperative approach |
| Define the desire state and it will create, update and delete resources | Define task and step to execute |

## Commands

```
# Show state
terraform state list
terraform state show 'module.vpc.aws_vpc.this[0]'
```

