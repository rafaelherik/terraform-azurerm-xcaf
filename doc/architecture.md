# Why this CAF?


Microsoft has launched the AVM(Azure Verified Modules) program to provide a set of modules that are verified and compliant with best practices. But there are some cases where you need to have more control over the infrastructure you are deploying. That's why this CAF was created. This CAF is a collection of modules that are not part of the AVM program but are compliant with best practices.

# What's new in this CAF?

- Following the AVM principles of module design, this CAF is designed to be modular and reusable.
- This CAF is designed to be a hub and spoke architecture, with the hub being the central module that connects to the spokes.

# How to use this CAF?


How to create a landing zone:

The ba
```hcl
module "lz" {
    source = "./caf/modules/patterns/lzn" 
    name = "my-lz" # Name of the landing zone
    locations = ["northeurope", "westeurope"] # Locations to deploy the landing zone
    # Tagging is a good strategy to manage resources and their usage and costs.
    tags = {
        environment = "dev"
        costcenter = "it"
    }

}
```