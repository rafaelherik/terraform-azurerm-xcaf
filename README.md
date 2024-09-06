# terraform-azurerm-xcaf
Terraform module for Cloud Adoption Framework in a different way.

# Roadmap
This repo is in an early stage and all the modules are not implemented. The roadmap is to implement all the modules and have a full working solution.

- [ ] Implement the governance module
- [ ] Implement the networking module
- [ ] Implement the compute module
- [ ] Implement the storage module
- [ ] Implement the database module
- [ ] Implement the security module
- [ ] Implement the monitoring module
- [ ] Implement the machine learning module
- [ ] Implement the automation module


## Manifesto

This is a project to create a different way to implement Azure Cloud Adoption Framework using Terraform. Microsoft launched Azure Verified Modules, but this initiative is not complete and some modules are not available. 
This project is a way to fill the gap and provide a different way to implement Azure Cloud Adoption Framework using Terraform.

This project is following the principles of:

- [Azure Landing Zones](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/landing-zone/) 
- [Azure Landing Zone Accelerator](https://github.com/Azure/ALZ-Landing-Zone-Accelerator).
- [Azure Verified Modules](https://azure.github.io/Azure-Verified-Modules/) - All the modules are implementing the interfaces of Azure Verified Modules.


## Disclaimer
>[!IMPORTANT]
This project is not affiliated with Microsoft. It is a personal project to fill the gap of Azure Verified Modules. Use it at your own risk.


## Setup the project

### Requirements

- Terraform CLI or OpenTofu CLI
- Azure CLI
- Azure Subscription

### Clone the repository

```bash
git clone https://github.com/Azure/terraform-azurerm-xcaf.git
```

### Configure the Makefile

The Makefile is used to run the Terraform/*OpenTofu* commands. It is used to initialize the OpenTofu CLI, plan, apply, destroy and other commands.
If you want to use the Terraform CLI, you can replate the `tofu` for `terraform` on the Makefile.

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