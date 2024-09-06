include .env.sh

# Terraform variables
TF_DIR := ./src/caf
TF_VARS := ./test.tfvars

# OpenTofu commands
init:
	terraform -chdir=$(TF_DIR) init

init-migrate:
	terraform -chdir=$(TF_DIR) init -migrate-state

plan:
	terraform -chdir=$(TF_DIR) plan 

apply:
	terraform -chdir=$(TF_DIR) apply -auto-approve

destroy:
	terraform -chdir=$(TF_DIR) destroy  -auto-approve

tf-help:
	terraform -help

# Combined target for init, plan, and apply
tofu-all: tofu-init tofu-plan tofu-apply

# Help target
help:
	@echo "Available targets:"
	@echo "  init    : Initialize OpenTofu"
	@echo "  plan    : Plan OpenTofu changes"
	@echo "  apply   : Apply OpenTofu changes"
	@echo "  destroy : Destroy OpenTofu-managed infrastructure"
	@echo "  all     : Run init, plan, and apply in sequence"

.PHONY: tofu-init tofu-plan tofu-apply tofu-destroy tofu-all help
