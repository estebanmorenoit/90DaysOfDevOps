# #90DaysOfDevOps Challenge - Day 61 - Terraform Commands

Welcome to Day 61 of the #90DaysOfDevOps Challenge! In today's challenge, we will explore essential Terraform commands that you'll frequently use in your infrastructure provisioning journey. Terraform is a powerful infrastructure as code tool, and understanding these commands is crucial for managing your infrastructure efficiently.

## Terraform CLI

The command line interface to Terraform is the `terraform` command, which accepts a variety of subcommands such as `terraform init` or `terraform plan`.

We refer to the `terraform` command line tool as "Terraform CLI" elsewhere in the documentation. This terminology is often used to distinguish it from other components you might use in the Terraform product family, such as [Terraform Cloud](https://developer.hashicorp.com/terraform/cloud-docs) or the various [Terraform providers](https://developer.hashicorp.com/terraform/language/providers), which are developed and released separately from Terraform CLI.

To view a list of the commands available in your current Terraform version, run `terraform` with no additional arguments:

```text
Usage: terraform [global options] <subcommand> [args]

The available commands for execution are listed below.
The primary workflow commands are given first, followed by
less common or more advanced commands.

Main commands:
  init          Prepare your working directory for other commands
  validate      Check whether the configuration is valid
  plan          Show changes required by the current configuration
  apply         Create or update infrastructure
  destroy       Destroy previously-created infrastructure

All other commands:
  console       Try Terraform expressions at an interactive command prompt
  fmt           Reformat your configuration in the standard style
  force-unlock  Release a stuck lock on the current workspace
  get           Install or upgrade remote Terraform modules
  graph         Generate a Graphviz graph of the steps in an operation
  import        Associate existing infrastructure with a Terraform resource
  login         Obtain and save credentials for a remote host
  logout        Remove locally-stored credentials for a remote host
  metadata      Metadata related commands
  output        Show output values from your root module
  providers     Show the providers required for this configuration
  refresh       Update the state to match remote systems
  show          Show the current state or a saved plan
  state         Advanced state management
  taint         Mark a resource instance as not fully functional
  untaint       Remove the 'tainted' state from a resource instance
  version       Show the current Terraform version
  workspace     Workspace management

Global options (use these before the subcommand, if any):
  -chdir=DIR    Switch to a different working directory before executing the
                given subcommand.
  -help         Show this help output, or the help for a specified subcommand.
  -version      An alias for the "version" subcommand.
```

(The output from your current Terraform version may be different than the above example.)

To get specific help for any specific command, use the `-help` option with the relevant subcommand. For example, to see help about the "validate" subcommand you can run `terraform validate -help`.

The inline help built into Terraform CLI describes the most important characteristics of each command. For more detailed information, refer to each command's page for details.

## Task 1: Understanding Basic Terraform Commands

To get started with Terraform, familiarize yourself with the following commands:

1. `terraform init`: This command initializes a Terraform project in the current directory and downloads the necessary provider plugins.
    
2. `terraform init -upgrade`: Use this command to upgrade the installed provider plugins to their latest versions.
    
3. `terraform plan`: It creates an execution plan by comparing the current state to the desired state defined in your Terraform configuration. It helps you understand the changes that Terraform will make when you apply your configuration.
    
4. `terraform apply`: This command applies the changes defined in your Terraform configuration and provisions or modifies the infrastructure accordingly.
    
5. `terraform validate`: It validates the syntax and configuration of your Terraform files, ensuring they adhere to the required format and standards.
    
6. `terraform fmt`: Use this command to format your Terraform files, ensuring consistent code style and readability.
    
7. `terraform destroy`: This command destroys the resources defined in your Terraform configuration, removing them from the infrastructure.
    

Along with these essential commands, it's important to have a broad understanding of Terraform and its competitors. **Terraform's main competitors** include **Ansible**, **Packer**, **Cloud Foundry,** and **Kubernetes**. Each tool has its unique strengths and use cases, and it's beneficial to explore and understand their differences.

In conclusion, mastering these Terraform commands empowers you to effectively manage and provision your infrastructure. Stay tuned for Day 62 of the #90DaysOfDevOps Challenge where we'll continue exploring Terraform.