## Getting Started

To get started with the CAF modules, you need to have an Azure subscription and the Azure CLI installed.

### Prerequisites

- Azure subscription
- Azure CLI
- OpenTofu CLI

### Installation

1. Install the CAF modules
2. Initialize the CAF modules
3. Create a new landing zone
4. Create resources on the landing zone

### Creating a new landing zone

Before creating a new landing zone, and starting with your infrastructure project, you need to define the landing zones you want to create.

Landing zones are a way to group resources in Azure. They are used to create a set of default configurations and attributes for the landing zones, and can be used as a base for more complex configurations.

On each landing zone, you can then create resources such as virtual networks, subnets, and other networking components.

It's important to note that landing zones are not mandatory, but they can help you to create a more consistent and secure infrastructure. The Tofu CAF modules provide a set of default configurations to help you to get started with your infrastructure project, but you must adapt them to your needs.

One important thing to define is how are you going to provision the resources and how are you going to organize your code, if you are going to have a single repository with all the code, or if you are going to have a repository per landing zone, o even if you see a third approach. 