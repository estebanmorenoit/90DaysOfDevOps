# #90DaysOfDevOps Challenge - Day 89 - DevOps Project 10 - Mounting S3 Bucket on EC2 Linux using S3FS

Welcome to Day 89 of the #90DaysOfDevOps Challenge. In today's project, we will be mounting an AWS S3 bucket on an EC2 Linux instance using S3FS. Let's get started!

## Project Description

In this AWS Mini Project, you will learn how to Mount an AWS S3 Bucket on an Amazon EC2 Linux instance using S3FS. The project provides a hands-on experience with Amazon Web Services (AWS) and covers key components such as AWS S3, Amazon EC2, and S3FS.

Through practical implementation, you will gain valuable insights into securely integrating AWS services, managing data storage in S3, and leveraging S3FS to enable seamless access and interaction between EC2 instances and S3 buckets.

## Hands-on Project: Mounting S3 Bucket on EC2 Linux using S3FS

### Step 1: Create a New IAM User

Begin by creating a new IAM user in the AWS console. Go to the IAM service, click on "Users," and then "Add user." Enter the name of the new user and proceed to the next step.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1691082593326/b63526e0-ec57-4314-bf05-7ea73c856eaa.jpeg align="center")

### Step 2: Attach Policies to the User

During user creation, select "Attach Policies directly" and click on "Create Policy." Create a new policy with the settings mentioned below, focusing on S3-related actions:

* **Service:** S3
    
* **Actions:** ListAllMyBuckets, ListBucket, ListBucketVersions, GetObject, GetObjectVersion, PutObject
    
* **Resources:** Specific
    
    * **Bucket:** Any
        
    * **Object:** Any
        

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1691084230120/d38be309-5f13-4869-9e68-6d1fb71d5950.jpeg align="center")

### Step 3: Create IAM User and Attach Policy

After creating the policy, give it a suitable name and proceed to create the IAM user, attaching the newly created policy to the user.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1691082795042/e6140c7b-b879-46a5-a959-173fb7e0ad57.jpeg align="center")

### Step 4: Get Access Keys

Once the user is created, go to "Security Credentials," and under "Access Keys," click on "Create Keys." Choose "Command Line Interface (CLI)" and get the Access Key and Secret Key.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1691082876539/1e19e015-db9f-45b3-8757-873d54567072.jpeg align="center")

### Step 5: Create EC2 Instance

Create a new `t2.micro` instance on AWS EC2.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1691082996852/1a3c9845-c3f3-42c8-8c2d-00fde36235eb.jpeg align="center")

### Step 6: Install AWS CLI

On the EC2 instance, install the AWS CLI using the appropriate package manager.

```bash
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1691083202232/570b69be-76fa-46d8-90a1-69f62ef50569.jpeg align="center")

### Step 7: Install S3FS

After installing AWS CLI, proceed to install S3FS on the EC2 instance.

```bash
sudo apt install s3fs -y
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1691083324232/74f3faef-7637-4745-afb2-f383c03237ec.jpeg align="center")

### Step 8: Create a Folder and Add Files

Create a folder named "bucket" at a location `/home/ubuntu` on the EC2 instance. Add 2–3 files to this folder.

```bash
mkdir bucket
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1691083408788/c4dc0df9-1be0-42f2-aa7f-44ba03955e22.jpeg align="center")

```bash
touch test1.txt test2.txt test3.txt
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1691083491295/b6bc3c4d-39a6-4d0d-a3e0-504b3f2594d8.jpeg align="center")

### Step 9: Create S3 Bucket

In the AWS console, create an S3 bucket with a suitable name.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1691083678938/6548980d-afb2-4b31-8b34-199febccdc44.jpeg align="center")

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1691084056722/3cf8e1af-bdfc-4a35-8553-6639fe00ef63.jpeg align="center")

### Step 10: Configure AWS CLI

On the EC2 instance, configure the AWS CLI by running the command `aws configure` and providing the Access Key and Secret Key obtained earlier.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1691083804752/1fa535e9-b95e-4e0c-85b5-803bd81e6d05.jpeg align="center")

### Step 11: Sync Files to S3 Bucket

Run the below command to sync the files from the given location on the EC2 instance to the S3 bucket.

```bash
aws s3 sync /home/ubuntu/bucket s3://devopschallenge-day89-s3bucket
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1691083988200/d5cee835-a378-4db9-a241-ccbbf8671c00.jpeg align="center")

### Step 12: Verify the Sync

Refresh the objects inside the S3 bucket to confirm that all the files from the EC2 instance are successfully uploaded to the S3 bucket.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1691084090799/22c9f0a0-52d8-43d7-aaca-36d4a5e273c9.jpeg align="center")

Congratulations on completing Day 89 of the #90DaysOfDevOps Challenge. You have successfully mounted an AWS S3 bucket on an EC2 Linux instance using S3FS, gaining valuable knowledge about AWS, S3, EC2, and S3FS in the process. Stay tuned for tomorrow, when we'll cover the last day of the challenge!