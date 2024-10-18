terraform {
  backend "remote" {
    organization = "Eagle_Industries"  # Replace with your Terraform Cloud organization

    workspaces {
      name = "CloudFileStorage"  # Replace with your Terraform Cloud workspace
    }
  }
}