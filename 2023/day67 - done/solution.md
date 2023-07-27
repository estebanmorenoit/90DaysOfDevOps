# #90DaysOfDevOps Challenge - Day 67 - AWS S3 Bucket Creation and Management with Terraform

Welcome to Day 67 of the #90DaysOfDevOps Challenge! Today, we will explore the powerful capabilities of Amazon S3 (Simple Storage Service) and learn how to create and manage S3 buckets using Terraform. S3 is a highly scalable, secure, and reliable object storage service offered by AWS.

## AWS S3 Bucket & Terraform

AWS S3 (Simple Storage Service) is a versatile storage solution that caters to a wide range of use cases, including data backup and restore, content distribution, application data storage, and even hosting static websites. With its robust features and flexible configuration options, **S3** provides a reliable foundation for managing your data in the cloud.

By leveraging **Terraform**, an Infrastructure as Code (IaC) tool, you can easily create and manage **S3 buckets** in **AWS**. Terraform allows you to define your desired state for **S3 buckets** using declarative code, enabling efficient provisioning and configuration. You can specify various bucket attributes such as access control, versioning, lifecycle policies, and more, ensuring your **S3 buckets** align with your specific requirements.

With **Terraform**, you can automate the entire lifecycle of your **S3 buckets**, from creation to management and even destruction if needed. This helps in maintaining consistency across different environments and simplifies the process of managing large-scale deployments.

Whether you need to store and retrieve data, distribute content, or host static websites, **Terraform** provides an intuitive and scalable approach to creating and managing **AWS S3 buckets**. By leveraging the power of Infrastructure as Code, you can achieve efficient, repeatable, and scalable data management solutions in the cloud.

## Task: Creating and Managing S3 Buckets Using Terraform.

### Step 1: Create an S3 Bucket using Terraform

To create an S3 bucket using Terraform, define the following resource block in your Terraform configuration file:

```bash
resource "aws_s3_bucket" "my_bucket" {
  bucket = "devopschallenge-s3-bucket"
}
```

### Step 2: Configure Public Read Access

To configure the S3 bucket to allow public read access, add the following resource block:

```bash
# Allow public read acces
resource "aws_s3_bucket_public_access_block" "public_access_block" {
  bucket = aws_s3_bucket.my_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}
```

### Step 3: Create an S3 Bucket Policy for IAM User or Role

To create an S3 bucket policy that allows read-only access to a specific IAM user or role, modify the existing bucket policy resource block as follows:

```bash
# Bucket policy to allow read-only access to the devops-user
resource "aws_s3_bucket_policy" "my_bucket_policy" {
  bucket = aws_s3_bucket.my_bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "AllowUserAccess"
        Effect = "Allow"
        Principal = {
          AWS = "arn:aws:iam::974262444728:user/iamadmin"
        }
        Action   = "s3:GetObject"
        Resource = "${aws_s3_bucket.my_bucket.arn}/*"
      }
    ]
  })
}
```

### Step 4: Enable Versioning

To enable versioning for the S3 bucket, add the following resource block:

```bash
# Enable versioning for the S3 bucket
resource "aws_s3_bucket_versioning" "bucket_versioning" {
  bucket = aws_s3_bucket.my_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}
```

This resource block enables versioning, which allows you to keep multiple versions of an object in your S3 bucket.

### Step 5: Execute Terraform

Run `terraform init`, `terraform plan`, and `terraform apply` to create the above infrastructure.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689875000104/1235c087-f41f-4fa2-947c-f19388908004.jpeg)

### Step 6: Validate the infrastructure

Navigate to the S3 Dashboard and verify if the S3 Bucket created allows public read access and if bucket versioning is enabled.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689876955721/a33b93de-cde3-498a-b3ce-86871377ef77.jpeg)

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1689876984248/506822a3-faad-40cb-96f3-f7acdaadd0d2.jpeg)

By following these steps, you will be able to create and manage S3 buckets in AWS using Terraform. Take advantage of the flexibility and scalability offered by S3 to meet your storage needs effectively.

Stay tuned for Day 68 of the #90daysofdevops challenge, where we'll explore Auto Scaling Groups using Terraform.