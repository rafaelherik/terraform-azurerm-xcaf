resource "terraform_data" "resource_group_location_check" {
  lifecycle {
    precondition {
      condition     = local.valid_rg_locations
      error_message = "The location of each resource group must be one of the locations specified in the locations variable."
    }
  }
}

