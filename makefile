# Terraform variables
TF_DIR := ./src/caf
TF_VARS := $(TF_DIR)/test.tfvars

# OpenTofu commands
init:
	tofu -chdir=$(TF_DIR) init

plan:
	tofu -chdir=$(TF_DIR) plan -var-file=$(TF_VARS)

apply:
	tofu -chdir=$(TF_DIR) apply -var-file=$(TF_VARS) -auto-approve

destroy:
	tofu -chdir=$(TF_DIR) destroy -var-file=$(TF_VARS) -auto-approve

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
