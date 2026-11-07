# Terraform Azure Blob Remote State Backend Configuration
# For local testing, you can comment this block out.
# For CI/CD Pipeline (GitHub Actions / Azure DevOps), uncomment and provide your values:
#
# terraform {
#   backend "azurerm" {
#     resource_group_name  = "rg-terraform-state"
#     storage_account_name = "tfstatehubspokestg"
#     container_name       = "tfstate"
#     key                  = "hubspoke-pe.terraform.tfstate"
#   }
# }
