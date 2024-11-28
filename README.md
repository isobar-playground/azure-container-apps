# Azure Container Apps Terraform Configuration

This repository contains the Terraform configuration for container apps in Azure.

## Directory Structure

- `example.terraform.tfvars`: Example Terraform variables file.
- `.gitignore`: Configuration file to ignore files that should not be tracked by Git.

## Configuration Files

### `example.terraform.tfvars`

This file contains the variables used in the Terraform configuration files. Example values:

```terraform
# The name of the project used for naming resources
project_name = ""

# The Azure subscription ID
subscription_id = ""

# The domain name to use for the container app
domain_name = ""
```

In order to run the Terraform configuration, you need to create a `terraform.tfvars` file with the actual values for the variables.

## Usage

1. Clone the repository:
    ```sh
    git clone git@github.com:isobar-playground/azure-container-apps.git
    cd azure-container-apps
    ```

2. Configure the variables in the `terraform.tfvars` file.

3. Initialize Terraform:
    ```sh
    terraform init
    ```

4. Plan and apply the configuration:
    ```sh
    terraform plan
    terraform apply
    ```