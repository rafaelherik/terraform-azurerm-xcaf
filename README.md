# terraform-azurerm-xcaf
Terraform module for Cloud Adoption Framework in a different way.



## Manifesto

This is a project to create a different way to implement Azure Cloud Adoption Framework using Terraform. Microsoft launched Azure Verified Modules, but this initiative is not complete and some modules are not available. 
This project is a way to fill the gap and provide a different way to implement Azure Cloud Adoption Framework using Terraform.

This project is following the principles of:

- [Azure Landing Zones](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/landing-zone/) 
- [Azure Verified Modules](https://azure.github.io/Azure-Verified-Modules/) - All the modules are implementing the interfaces of Azure Verified Modules.


## Disclaimer
>[!IMPORTANT]
This project is not affiliated with Microsoft. It is a personal project to fill the gap of Azure Verified Modules. Use it at your own risk.


## Setup the project

### Requirements

- Terraform CLI
- Azure CLI
- Azure Subscription

### Clone the repository

```bash
git clone https://github.com/Azure/terraform-azurerm-xcaf.git
```

### Configure the environment variables

Create a `.env.sh` file with the following variables, you can use the `.env.sh.template` as a template:

```bash
export ARM_SUBSCRIPTION_ID="<<ARM_SUBSCRIPTION_ID>>"
export ARM_TENANT_ID="<<ARM_TENANT_ID>>"
export ARM_CLIENT_ID="<<ARM_CLIENT_ID>>"
export ARM_CLIENT_SECRET="<<ARM_CLIENT_SECRET>>"

This file is used to configure the environment variables for the project.

```bash
source .env.sh
```

### Configure the Makefile

The Makefile is used to run the Terraform commands. It is used to initialize the Terraform CLI, plan, apply, destroy and other commands.

```bash
make help
```


### Run the project

- Plan the changes
```bash
make plan
```

- Apply the changes
```bash
make apply
```

- Destroy the infrastructure
```bash
make destroy
```


- Run all the commands in sequence
```bash
make all
```

The commands are running under the `src/caf` directory, using the `test.tfvars` file as the input. This is configuration is used for the test environment while the module is under development.


## Contributing

Contributions are welcome! Please read our [Contributing Guide](CONTRIBUTING.md) for more information.

## License

This project is licensed under the [GNU GENERAL PUBLIC LICENSE](LICENSE).