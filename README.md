# Microsoft Verified Terraform Module

The Verified Terraform module is a template repository to help developers create their own Terraform Module.

As we've used Microsoft 1ES Runners Pool as our acceptance test runner, **only Microsoft members could use this template for now**.

Enjoy it by following steps:

1. Use [this template](https://github.com/Azure/terraform-verified-module) to create your repository.
2. Read [Onboard 1ES hosted Github Runners Pool through Azure Portal](https://eng.ms/docs/cloud-ai-platform/devdiv/one-engineering-system-1es/1es-docs/1es-github-runners/createpoolportal), install [1ES Resource Management](https://github.com/apps/1es-resource-management) on your repo.
3. Add a Github [Environment](https://docs.github.com/en/actions/deployment/targeting-different-environments/using-environments-for-deployment) named **acctests** in your repo, setup [**Required Reviewers**](https://docs.github.com/en/actions/deployment/targeting-different-environments/using-environments-for-deployment#required-reviewers).
4. Update [`acc-test.yaml`](.github/workflows/acc-test.yaml), modify `runs-on: [self-hosted, 1ES.Pool=<YOUR_REPO_NAME>]` with your 1es runners' pool name (basically it's your repo's name).
5. Write Terraform code in a new branch.
6. Run `docker run --rm -v ${pwd}:/src -w /src mcr.microsoft.com/azterraform:latest make pre-commit` to format the code.
7. Run `docker run --rm -v $(pwd):/src -w /src mcr.microsoft.com/azterraform:latest make pr-check` to run the check in local.
8. Create a pull request for the main branch.
    * CI pr-check will be executed automatically.
    * Once pr-check was passed, with manually approval, the e2e test and version upgrade test would be executed.
9. Merge pull request.
10. Enjoy it!

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name                                                                      | Version       |
|---------------------------------------------------------------------------|---------------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3        |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm)       | >= 3.0, < 4.0 |

## Providers

| Name                                                          | Version       |
|---------------------------------------------------------------|---------------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >= 3.0, < 4.0 |

## Modules

No modules.

## Resources

| Name                                                                                                                                                            | Type        |
|-----------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------|
| [azurerm_automation_account.management](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/automation_account)                     | resource    |
| [azurerm_log_analytics_linked_service.management](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/log_analytics_linked_service) | resource    |
| [azurerm_log_analytics_solution.management](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/log_analytics_solution)             | resource    |
| [azurerm_log_analytics_workspace.management](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/log_analytics_workspace)           | resource    |
| [azurerm_resource_group.management](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group)                             | resource    |
| [azurerm_resource_group.management](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group)                          | data source |

## Inputs

| Name                                                                                                                                                                                                                             | Description                                                                                                              | Type                                                                                                                           | Default                                                                                                                                                                                                                                                                                                          | Required |
|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:--------:|
| <a name="input_automation_account_encryption"></a> [automation\_account\_encryption](#input\_automation\_account\_encryption)                                                                                                    | The encryption configuration for the Azure Automation Account.                                                           | <pre>object({<br>    key_vault_key_id          = string<br>    user_assigned_identity_id = optional(set(string))<br>  })</pre> | `null`                                                                                                                                                                                                                                                                                                           |    no    |
| <a name="input_automation_account_identity"></a> [automation\_account\_identity](#input\_automation\_account\_identity)                                                                                                          | The identity to assign to the Azure Automation Account.                                                                  | <pre>object({<br>    type         = string<br>    identity_ids = optional(set(string))<br>  })</pre>                           | `null`                                                                                                                                                                                                                                                                                                           |    no    |
| <a name="input_automation_account_local_authentication_enabled"></a> [automation\_account\_local\_authentication\_enabled](#input\_automation\_account\_local\_authentication\_enabled)                                          | Whether or not local authentication is enabled for the Azure Automation Account.                                         | `bool`                                                                                                                         | `true`                                                                                                                                                                                                                                                                                                           |    no    |
| <a name="input_automation_account_name"></a> [automation\_account\_name](#input\_automation\_account\_name)                                                                                                                      | The name of the Azure Automation Account to create.                                                                      | `string`                                                                                                                       | n/a                                                                                                                                                                                                                                                                                                              |   yes    |
| <a name="input_automation_account_public_network_access_enabled"></a> [automation\_account\_public\_network\_access\_enabled](#input\_automation\_account\_public\_network\_access\_enabled)                                     | Whether or not public network access is enabled for the Azure Automation Account.                                        | `bool`                                                                                                                         | `true`                                                                                                                                                                                                                                                                                                           |    no    |
| <a name="input_automation_account_sku_name"></a> [automation\_account\_sku\_name](#input\_automation\_account\_sku\_name)                                                                                                        | The name of the SKU for the Azure Automation Account to create.                                                          | `string`                                                                                                                       | `"Basic"`                                                                                                                                                                                                                                                                                                        |    no    |
| <a name="input_deploy_linked_automation_account"></a> [deploy\_linked\_automation\_account](#input\_deploy\_linked\_automation\_account)                                                                                         | A boolean flag to determine whether to deploy the Azure Automation Account linked to the Log Analytics Workspace or not. | `bool`                                                                                                                         | `true`                                                                                                                                                                                                                                                                                                           |    no    |
| <a name="input_deploy_resource_group"></a> [deploy\_resource\_group](#input\_deploy\_resource\_group)                                                                                                                            | A boolean flag to determine whether to deploy the Azure Resource Group or not.                                           | `bool`                                                                                                                         | `true`                                                                                                                                                                                                                                                                                                           |    no    |
| <a name="input_location"></a> [location](#input\_location)                                                                                                                                                                       | The Azure region where the resources will be deployed.                                                                   | `string`                                                                                                                       | n/a                                                                                                                                                                                                                                                                                                              |   yes    |
| <a name="input_log_analytics_solution_names"></a> [log\_analytics\_solution\_names](#input\_log\_analytics\_solution\_names)                                                                                                     | The name of the Log Analytics Solution to create.                                                                        | `list(string)`                                                                                                                 | <pre>[<br>  "AgentHealthAssessment",<br>  "AntiMalware",<br>  "ChangeTracking",<br>  "ContainerInsights",<br>  "Security",<br>  "SecurityInsights",<br>  "ServiceMap",<br>  "SQLAdvancedThreatProtection",<br>  "SQLAssessment",<br>  "SQLVulnerabilityAssessment",<br>  "Updates",<br>  "VMInsights"<br>]</pre> |    no    |
| <a name="input_log_analytics_workspace_allow_resource_only_permissions"></a> [log\_analytics\_workspace\_allow\_resource\_only\_permissions](#input\_log\_analytics\_workspace\_allow\_resource\_only\_permissions)              | Whether or not to allow resource-only permissions for the Log Analytics Workspace.                                       | `bool`                                                                                                                         | `false`                                                                                                                                                                                                                                                                                                          |    no    |
| <a name="input_log_analytics_workspace_cmk_for_query_forced"></a> [log\_analytics\_workspace\_cmk\_for\_query\_forced](#input\_log\_analytics\_workspace\_cmk\_for\_query\_forced)                                               | Whether or not to force the use of customer-managed keys for query in the Log Analytics Workspace.                       | `bool`                                                                                                                         | `null`                                                                                                                                                                                                                                                                                                           |    no    |
| <a name="input_log_analytics_workspace_daily_quota_gb"></a> [log\_analytics\_workspace\_daily\_quota\_gb](#input\_log\_analytics\_workspace\_daily\_quota\_gb)                                                                   | The daily ingestion quota in GB for the Log Analytics Workspace.                                                         | `number`                                                                                                                       | `null`                                                                                                                                                                                                                                                                                                           |    no    |
| <a name="input_log_analytics_workspace_internet_ingestion_enabled"></a> [log\_analytics\_workspace\_internet\_ingestion\_enabled](#input\_log\_analytics\_workspace\_internet\_ingestion\_enabled)                               | Whether or not internet ingestion is enabled for the Log Analytics Workspace.                                            | `bool`                                                                                                                         | `true`                                                                                                                                                                                                                                                                                                           |    no    |
| <a name="input_log_analytics_workspace_internet_query_enabled"></a> [log\_analytics\_workspace\_internet\_query\_enabled](#input\_log\_analytics\_workspace\_internet\_query\_enabled)                                           | Whether or not internet query is enabled for the Log Analytics Workspace.                                                | `bool`                                                                                                                         | `true`                                                                                                                                                                                                                                                                                                           |    no    |
| <a name="input_log_analytics_workspace_name"></a> [log\_analytics\_workspace\_name](#input\_log\_analytics\_workspace\_name)                                                                                                     | The name of the Log Analytics Workspace to create.                                                                       | `string`                                                                                                                       | n/a                                                                                                                                                                                                                                                                                                              |   yes    |
| <a name="input_log_analytics_workspace_reservation_capacity_in_gb_per_day"></a> [log\_analytics\_workspace\_reservation\_capacity\_in\_gb\_per\_day](#input\_log\_analytics\_workspace\_reservation\_capacity\_in\_gb\_per\_day) | The reservation capacity in GB per day for the Log Analytics Workspace.                                                  | `number`                                                                                                                       | `null`                                                                                                                                                                                                                                                                                                           |    no    |
| <a name="input_log_analytics_workspace_retention_in_days"></a> [log\_analytics\_workspace\_retention\_in\_days](#input\_log\_analytics\_workspace\_retention\_in\_days)                                                          | The number of days to retain data for the Log Analytics Workspace.                                                       | `number`                                                                                                                       | `30`                                                                                                                                                                                                                                                                                                             |    no    |
| <a name="input_log_analytics_workspace_sku"></a> [log\_analytics\_workspace\_sku](#input\_log\_analytics\_workspace\_sku)                                                                                                        | The SKU to use for the Log Analytics Workspace.                                                                          | `string`                                                                                                                       | `"PerGB2018"`                                                                                                                                                                                                                                                                                                    |    no    |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name)                                                                                                                                  | The name of the Azure Resource Group where the resources will be created.                                                | `string`                                                                                                                       | n/a                                                                                                                                                                                                                                                                                                              |   yes    |
| <a name="input_tags"></a> [tags](#input\_tags)                                                                                                                                                                                   | A map of tags to apply to the resources created.                                                                         | `map(string)`                                                                                                                  | `{}`                                                                                                                                                                                                                                                                                                             |    no    |

## Outputs

| Name                                                                                                                                                  | Description                                                     |
|-------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------|
| <a name="output_automation_account_msi_prinicpal_id"></a> [automation\_account\_msi\_prinicpal\_id](#output\_automation\_account\_msi\_prinicpal\_id) | value of the MSI principal ID for the Azure Automation Account. |
| <a name="output_automation_account_resource_id"></a> [automation\_account\_resource\_id](#output\_automation\_account\_resource\_id)                  | value of the resource ID for the Azure Automation Account.      |
| <a name="output_log_analytics_workspace_resource_id"></a> [log\_analytics\_workspace\_resource\_id](#output\_log\_analytics\_workspace\_resource\_id) | value of the resource ID for the Log Analytics Workspace.       |
| <a name="output_resource_group_resource_id"></a> [resource\_group\_resource\_id](#output\_resource\_group\_resource\_id)                              | value of the resource ID for the Azure Resource Group.          |
<!-- END_TF_DOCS -->
