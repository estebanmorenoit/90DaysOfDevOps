# #90DaysOfDevOps Challenge - Day 71 - Terraform Interview Questions

Welcome to Day 71 of the #90DaysOfDevOps Challenge! Today, we'll dive into Terraform interview questions to help you prepare for your next DevOps interview. Whether you're a beginner or an experienced practitioner, these questions and answers will test your knowledge of Terraform concepts, best practices, and real-world scenarios.

## Interview Questions and Answers

### 1 - What is Terraform and how is it different from other IaaC tools?

**Terraform** is an open-source infrastructure-as-code software developed by HashiCorp. It allows users to define, manage, and provision infrastructure resources using declarative configuration files. Terraform enables you to describe your infrastructure in code, making it versionable, maintainable, and repeatable.

**Key Differences from Other IaC Tools:**

* **Multi-Cloud Support**: Terraform supports multiple cloud providers, such as AWS, Azure, Google Cloud, and more, allowing you to manage heterogeneous cloud environments.
    
* **Resource Graph**: Terraform builds a dependency graph for resources, enabling it to parallelize resource creation and modification, leading to faster deployments.
    
* **Immutable Infrastructure**: Terraform follows the immutable infrastructure paradigm, making changes by recreating resources rather than modifying them in place.
    
* **State Management**: Terraform stores the state of the deployed infrastructure, allowing it to track changes and apply only the necessary modifications.
    
* **Extensibility**: Terraform can be extended with custom providers and modules to support various services and configurations.
    

### 2 - How do you call a [main.tf](http://main.tf) module?

To call a module named "main" in Terraform, you define it in your root configuration file using the `module` block. Here's an example:

```bash
module "main" {
  source = "./path/to/main_module"
  
  # Module input variables, if any
  var1 = "value1"
  var2 = "value2"
}
```

In this example, we are calling the "main\_module" from the specified source path. We can also pass input variable values using the syntax `var.<variable_name>`.

### 3 - What exactly is Sentinel? Can you provide a few examples of where we can use Sentinel policies?

**Sentinel** is a policy-as-code framework by HashiCorp that helps you define, enforce, and automate policies across your infrastructure provisioning. It ensures that infrastructure deployments align with security, compliance, and governance requirements.

Examples of Sentinel policies include:

* **Enforcing Resource Naming Conventions**: Ensuring that all resources follow a standardized naming convention to improve clarity and organization.
    
* **Limiting Resource Deployment by Region**: Controlling which regions are allowed for deploying certain resources to comply with data sovereignty regulations.
    
* **Requiring Tags on Resources**: Ensuring all resources are tagged appropriately for tracking and cost allocation purposes.
    

### 4 - You have a Terraform configuration file that defines an infrastructure deployment. However, there are multiple instances of the same resource that need to be created. How would you modify the configuration file to achieve this?

To create multiple instances of the same resource in Terraform, you can use **count** or **for\_each** meta-arguments.

For example, let's say you want to create multiple AWS EC2 instances:

```bash
resource "aws_instance" "server-instance" {
  count = 5  # You can specify the number of instances you want
  
  # Other configuration parameters for the EC2 instance
}
```

The above code will create 5 EC2 instances, and each instance will have its unique resource name like `aws_instance.server-instance[0]`, `aws_instance.server-instance[1]`, and so on.

### 5 - You want to know from which paths Terraform is loading providers referenced in your Terraform configuration (\*.tf files). You need to enable debug messages to find this out. Which of the following would achieve this?

A. `Set the environment variable TF_LOG=TRACE`

B. `Set verbose logging for each provider in your Terraform configuration`

C. `Set the environment variable TF_VAR_log=TRACE`

D. `Set the environment variable TF_LOG_PATH`

**Answer:** **A. Set the environment variable** `TF_LOG=TRACE`**.**

Setting the environment variable `TF_LOG=TRACE` will enable debug logging in Terraform, allowing you to see messages about which provider plugins are being loaded and from which paths they are being referenced.

### 6 - Below command will destroy everything that is being created in the infrastructure. Tell us how would you save any particular resource while destroying the complete infrastructure.

```bash
terraform destroy
```

To prevent a particular resource from being destroyed during a `terraform destroy` command, you can use the `lifecycle` meta-argument with the `prevent_destroy` attribute set to `true`. This attribute allows you to preserve specific resources even when other resources are being destroyed.

```bash
resource "aws_instance" "example" {
  # Resource configuration
  
  lifecycle {
    prevent_destroy = true
  }
}
```

In the above example, the `aws_instance` resource named "example" will not be destroyed when running `terraform destroy`.

### 7 - Which module is used to store .tfstate file in S3?

The `"S3 backend"` module is used to store the `.tfstate` file in an Amazon S3 bucket. The `.tfstate` file contains the state of your infrastructure, and using an S3 bucket as the backend provides a centralized and secure location to store this state file.

### 8 - How do you manage sensitive data in Terraform, such as API keys or passwords?

To manage sensitive data in Terraform, you can use **Terraform's sensitive data handling mechanisms**:

* **Sensitive Input Variables**: Mark sensitive variables in your module or root configuration using `sensitive = true`. This will prevent their values from being displayed in logs and outputs.
    
* **Sensitive Outputs**: For resources that handle sensitive information, use the `sensitive = true` attribute for outputs. This will mask the output value in Terraform runs.
    
* **Vault or Third-Party Providers**: Utilize integration with vault services or third-party providers that securely manage sensitive data, like AWS Secrets Manager or HashiCorp Vault.
    

### 9 - You are working on a Terraform project that needs to provision an S3 bucket and a user with read and write access to the bucket. What resources would you use to accomplish this, and how would you configure them?

To provision an S3 bucket and a user with read and write access, you can use the following AWS resources:

```bash
# Create an S3 bucket
resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-awesome-bucket"
  # Other S3 bucket configurations
}

# Create an IAM user
resource "aws_iam_user" "my_user" {
  name = "my-user"
}

# Create IAM policy for S3 access
resource "aws_iam_policy" "my_policy" {
  name        = "my-policy"
  description = "Allow read and write access to the S3 bucket"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = "s3:*"
        Effect   = "Allow"
        Resource = aws_s3_bucket.my_bucket.arn
      }
    ]
  })
}

# Attach the IAM policy to the user
resource "aws_iam_user_policy_attachment" "my_user_policy_attachment" {
  user       = aws_iam_user.my_user.name
  policy_arn = aws_iam_policy.my_policy.arn
}
```

In this configuration, we create an S3 bucket, an IAM user, and an IAM policy that grants access to perform S3 actions on the specified bucket. Finally, we attach the policy to the IAM user, providing them with read and write access to the S3 bucket.

### 10 - Who maintains Terraform providers?

**Terraform providers** are maintained by the respective **cloud service providers or third-party organizations** that offer integration with specific cloud platforms, services, or tools. For example, the AWS provider is maintained by Amazon Web Services, and the Azure provider is maintained by Microsoft.

### 11 - How can we export data from one module to another?

To export data from one Terraform module to another, you can use **outputs**. Outputs allow you to expose certain attributes or values from a module so that they can be used by other modules or the root configuration.

In the module where you want to export the data, define the output block:

```bash
# Module "module_a"
output "exported_value" {
  value = some_resource.some_attribute
}
```

In the module where you want to use the exported data, call the module and access the output value:

```bash
# Module "module_b"
module "module_a_instance" {
  source = "./path/to/module_a"
}

resource "some_other_resource" "example" {
  # Use the exported value from module_a
  some_attribute = module.module_a_instance.exported_value
}
```

In this example, we are exporting the value of `some_resource.some_attribute` from "module\_a" and using it in "module\_b" as `module.module_a_instance.exported_value`.

That wraps up Day 71 of the #90DaysOfDevOps Challenge. We hope these Terraform interview questions and answers help you prepare for your next interview. See you tomorrow to explore a new topic, Grafana!