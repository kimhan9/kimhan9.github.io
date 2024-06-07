# DigitalOcean

## Provision droplet using Terraform

1. Generate Personal Access Token (API → Tokens → Generate New Token)
2. Export the token: `export DIGITALOCEAN_ACCESS_TOKEN="my-token"`
3. Deploy Terraform
4. Get status: `terraform show terraform.tfstate`

Reference: [Deploy an application to a DigitalOcean droplet](https://developer.hashicorp.com/terraform/tutorials/applications/digitalocean-provider)

## Terraform Template
`main.tf`
```
terraform {
  required_version = ">= 1.0.0"

  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

provider "digitalocean" {}

# The name of the key in DigitalOcean
data "digitalocean_ssh_key" "main" {
  name = "mba"
}

resource "digitalocean_droplet" "terramino" {
  count = 3
  image     = "ubuntu-22-04-x64"
  name      = "www"
  region    = "sgp1"
  size      = "s-1vcpu-1gb"
  ssh_keys  = [data.digitalocean_ssh_key.main.id]
}

output "ip_address" {
  description = "Droplet IP"
  value       = digitalocean_droplet.terramino[*].ipv4_address
}
```