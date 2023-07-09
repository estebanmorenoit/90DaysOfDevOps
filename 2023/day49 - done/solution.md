# #90DaysOfDevOps Challenge - Day 49 -  Interview Questions on AWS

In today's session of the #90DaysOfDevOps Challenge, we will delve into some common interview questions related to Amazon Web Services (AWS). As AWS continues to be a dominant player in the cloud computing industry, having a solid understanding of AWS services and concepts is crucial for any DevOps professional. Let's explore these interview questions and their significance:

### 1 - Name 5 AWS services you have used and their use cases:

**Amazon S3**: Amazon S3 is commonly used for object storage, backup, and archiving. It provides highly scalable and durable storage for various types of data, including images, videos, documents, and backups. S3 is often used as a content repository for websites and applications, enabling easy access and distribution of static files.

**AWS Lambda**: AWS Lambda is a serverless computing service that allows you to run your code without provisioning or managing servers. It enables event-driven architectures and is ideal for executing short-lived, event-triggered functions. Use cases for Lambda include real-time file processing, data transformation, microservices, and serverless web applications.

**Amazon EC2**: Amazon EC2 provides scalable virtual servers, known as instances, for running applications. EC2 offers a wide range of instance types with varying compute, memory, and storage capacities. It is commonly used for hosting web applications, running databases, performing data analytics, and running batch-processing jobs.

**AWS RDS**: AWS RDS (Relational Database Service) simplifies the management of relational databases. It supports popular database engines like MySQL, PostgreSQL, Oracle, and SQL Server. RDS automates database administration tasks such as backups, software patching, and database scaling. Use cases for RDS include web applications, e-commerce platforms, and enterprise applications requiring reliable and scalable database solutions.

**Amazon CloudFront**: Amazon CloudFront is a global content delivery network (CDN) that accelerates the delivery of content to end users. It caches and distributes content from edge locations located worldwide, reducing latency and improving performance. CloudFront is commonly used for delivering static and dynamic content, streaming media, and distributing software updates efficiently.

### 2 - What tools are used to send logs to the cloud environment?

Tools like **AWS CloudWatch Logs** and **AWS CloudTrail** are commonly used to send logs to the AWS cloud environment for monitoring and auditing purposes.

**AWS CloudWatch Logs** allows you to collect, monitor, and store logs from various AWS resources, such as EC2 instances, Lambda functions, and RDS databases. It enables you to gain insights into system and application behaviour, troubleshoot issues, and set up alarms based on log data.

**AWS CloudTrail** provides a comprehensive audit trail of API activity within your AWS account. It captures API calls made to AWS services, including the identity of the caller, the time of the call, and the parameters used. CloudTrail logs help with security analysis, compliance auditing, and troubleshooting by providing a detailed history of API events.

### 3 - What are IAM Roles? How do you create/manage them?

**IAM Roles** are AWS Identity and Access Management entities that grant permissions to AWS resources. They are preferred over using access keys as they provide temporary security credentials with limited privileges. IAM Roles allow you to grant permissions to AWS services, EC2 instances, Lambda functions, or other entities.

To create/manage IAM Roles, follow these steps:

1. Open the IAM console in the AWS Management Console.
    
2. Click on "Roles" in the navigation pane.
    
3. Click on the "Create role" button.
    
4. Choose the trusted entity type, such as AWS service or another AWS account.
    
5. Select the service or account that will assume the role.
    
6. Configure the permissions for the role by attaching policies or creating custom policies.
    
7. Provide a name and optional description for the role.
    
8. Review the settings and click on the "Create role" button.
    

You can manage IAM Roles by editing their policies, updating trust relationships, or attaching/detaching policies as per your requirements. It is important to regularly review and audit IAM Roles to ensure appropriate permissions and minimize security risks.

### 4 - How to upgrade or downgrade a system with zero downtime?

To achieve zero downtime during system upgrades or downgrades, consider the following approaches:

**Blue-Green Deployments**: Set up a duplicate environment (green) alongside the existing one (blue) and gradually shift traffic from blue to green. This allows for a seamless transition and rollback if needed.

**AWS Elastic Beanstalk Rolling Updates**: If you're using AWS Elastic Beanstalk, you can enable rolling updates. This feature replaces instances gradually, one at a time while maintaining the high availability of your application.

**Load Balancer with Auto Scaling**: Deploy your application behind a load balancer and use Auto Scaling to manage the underlying instances. This way, you can perform upgrades or downgrades by gradually replacing instances without impacting the overall system availability.

It's important to plan and test these strategies thoroughly to ensure a smooth transition without impacting your users' experience.

### 5 - What is infrastructure as code, and how do you use it?

**Infrastructure as code (IaC)** is the practice of managing and provisioning infrastructure using machine-readable definition files. It enables the automation and reproducibility of infrastructure deployment, reducing manual effort and increasing consistency.

With IaC, you can define your infrastructure resources, configurations, and dependencies using tools like **AWS CloudFormation** or **Terraform**. These tools allow you to declare your desired state of infrastructure in code, which can be version-controlled, tested, and deployed reliably.

By using IaC, you can create, modify, and delete AWS resources consistently and predictably. It also helps in managing complex infrastructures, enforcing best practices, and promoting collaboration within development and operations teams.

### 6 - What is a load balancer? Provide scenarios for each kind based on your experience.

A **load balancer** distributes incoming network traffic across multiple targets, such as EC2 instances or containers, to ensure optimal resource utilization and high availability. Here are scenarios for each kind of load balancer:

**Classic Load Balancer (CLB)**: It is ideal for balancing HTTP/HTTPS traffic among EC2 instances. Use cases include web applications, content delivery, and traditional load-balancing scenarios where layer 7 functionality is not required.

**Application Load Balancer (ALB)**: ALB works at the application layer (layer 7) and routes requests based on URL path, host, or query string. It is suitable for microservices architectures, serverless applications, and containerized environments. ALB allows you to

achieve advanced routing and content-based routing, enabling scenarios like routing requests to different services based on path patterns or managing API endpoints efficiently.

**Network Load Balancer (NLB)**: NLB handles TCP/UDP traffic at the transport layer (layer 4) and is designed for extreme performance, low latency, and high throughput. It is commonly used for scenarios requiring high network performance, such as gaming, real-time streaming, and IoT applications.

These load balancers provide flexibility and scalability to handle varying workloads, distribute traffic efficiently, and improve the overall availability and responsiveness of your applications.

### 7 - What is CloudFormation, and why is it used for?

**AWS CloudFormation** is a service that allows you to define and provision AWS infrastructure as code. It enables you to create and manage AWS resources using declarative templates, written in JSON or YAML format.

CloudFormation provides a reliable and repeatable way to create and manage resources across different AWS accounts and regions. It helps automate infrastructure provisioning, ensuring consistency and reducing manual effort. By defining your infrastructure in CloudFormation templates, you can version-control the templates, track changes, and easily replicate environments.

CloudFormation also supports orchestration and dependency management, allowing you to define the order of resource creation and handle resource dependencies. It simplifies the process of deploying complex infrastructure stacks, promotes infrastructure-as-code practices, and enables infrastructure to be treated as a part of the application lifecycle.

### 8 - Difference between AWS CloudFormation and AWS Elastic Beanstalk?

**AWS CloudFormation** focuses on infrastructure provisioning and management, whereas **AWS Elastic Beanstalk** is a Platform as a Service (PaaS) that simplifies application deployment and management.

CloudFormation allows you to define and provision AWS resources using templates, enabling infrastructure automation. It provides a way to create and manage a wide range of resources, including EC2 instances, load balancers, databases, and networking components. CloudFormation is suitable for scenarios where you have control over the infrastructure configuration and want fine-grained control over resource provisioning.

Elastic Beanstalk, on the other hand, abstracts the underlying infrastructure and automates the deployment, scaling, and monitoring of applications. It simplifies the process of deploying web applications and managing the underlying infrastructure components. Elastic Beanstalk is suitable for scenarios where you want to focus on the application code and rely on a managed environment for deployment and scaling.

In summary, CloudFormation is primarily used for infrastructure provisioning and management, while Elastic Beanstalk is focused on simplifying application deployment and management as a fully managed PaaS offering.

### 9 - What kinds of security attacks can occur on the cloud, and how can we minimize them?

Security attacks on the cloud can include:

**DDoS Attacks**: Distributed Denial of Service attacks aim to overwhelm resources and disrupt services. To minimize them, you can use services like AWS Shield, which provides DDoS protection, and configure network and application-level protections.

**Data Breaches**: Unauthorized access to sensitive data can lead to data breaches. Minimize this risk by implementing strong access controls, encrypting data at rest and in transit, applying least privilege principles, and regularly monitoring and auditing access.

**Account Compromise**: Unauthorized access to AWS accounts can result in unauthorized resource usage or data exposure. To minimize this, enable multi-factor authentication (MFA), implement strong password policies, regularly review IAM permissions, and use AWS CloudTrail for logging and auditing account activity.

**Insider Threats**: Malicious activities or accidental mistakes by authorized users can pose security risks. Implement proper access controls, segregation of duties, and monitoring mechanisms to detect and mitigate insider threats.

**Misconfigurations**: Misconfigured services or resources can expose vulnerabilities. Follow AWS security best practices, use security automation tools like AWS Config and AWS Trusted Advisor, and regularly perform security assessments and audits to identify and address misconfigurations.

By implementing a combination of preventive measures, monitoring, and ongoing security practices, you can significantly minimize the risk of security attacks in the cloud.

### 10 - Can we recover the EC2 instance when we have lost the key?

Yes, it is possible to recover access to an EC2 instance even if you have lost the key pair. Here's one possible approach:

1. Stop the EC2 instance for which you have lost the key pair.
    
2. Detach the root volume of the instance.
    
3. Create a new EC2 instance with a new key pair.
    
4. Attach the root volume of the old instance to the new instance.
    
5. Start the new instance and login using the new key pair.
    
6. Mount the old root volume and modify the authorized\_keys file to grant SSH access using the new key pair.
    
7. Unmount the volume, detach it from the new instance, and reattach it to the original instance.
    
8. Start the original instance, and now you can access it using the new key pair.
    

By following these steps, you can regain access to your EC2 instance even if the original key pair is lost. However, it is essential to ensure the security of the new key pair and take necessary precautions to protect your instances and data.

### 11 - What is a gateway?

In AWS, a **gateway** refers to services that act as an entry or exit point for traffic between different environments or networks. Here are some types of gateways in AWS:

**Amazon API Gateway**: It is a fully managed service for creating, deploying, and managing APIs at scale. API Gateway acts as a gateway for RESTful APIs, enabling you to expose backend services securely and integrate them with other AWS services.

**AWS Direct Connect**: It provides a dedicated network connection from your on-premises data centre to AWS. Direct Connect serves as a gateway between your private network and AWS, allowing you to establish a private and reliable connection for data transfer, reducing latency, and ensuring secure access to AWS resources.

**AWS Transit Gateway**: It is a network transit hub that simplifies the connectivity between Amazon Virtual Private

Clouds (VPCs) and your on-premises networks. Transit Gateway acts as a centralized gateway to route traffic between VPCs, VPN connections, and Direct Connect connections.

**Amazon S3 Gateway Endpoint**: It provides a direct and secure connection between your Amazon VPC and Amazon S3. The gateway endpoint acts as an entry point to access S3 buckets within your VPC without the need for an internet gateway or NAT instances.

These gateways facilitate connectivity, security, and efficient data transfer between different environments, enabling seamless integration of AWS services with your on-premises infrastructure or other networks.

### 12 - What is the difference between Amazon RDS, DynamoDB, and Redshift?

**Amazon RDS** (Relational Database Service): It is a managed relational database service that simplifies the deployment, operation, and scaling of relational databases. RDS supports popular database engines like MySQL, PostgreSQL, Oracle, and SQL Server. It is suitable for traditional relational database use cases, such as web applications, content management systems, and e-commerce platforms.

**Amazon DynamoDB**: It is a fully managed NoSQL database service that offers high performance, scalability, and availability. DynamoDB is designed to handle large amounts of data and provides single-digit millisecond latency at any scale. It is well-suited for use cases requiring fast and predictable performance, such as real-time applications, gaming, and ad tech platforms.

**Amazon Redshift**: It is a fully managed data warehousing service that enables fast and cost-effective analysis of large datasets. Redshift is optimized for online analytical processing (OLAP) workloads and supports high-performance queries on petabyte-scale data. It is commonly used for data warehousing, business intelligence, and analytics applications.

While Amazon RDS and DynamoDB are general-purpose databases, Redshift is specialized in data warehousing and analytics. The choice depends on the specific requirements of your application, including the data model, query patterns, scalability needs, and performance expectations.

### 13 - Do you prefer to host a website on S3? Explain your answer.

Yes, hosting a website on Amazon S3 can be a preferable option for static websites. Here's why:

1. **Cost-Effective**: S3 offers cost-effective storage and data transfer pricing. Hosting a static website on S3 can be significantly cheaper than maintaining traditional web servers, especially for low-traffic or simple websites.
    
2. **Scalability**: S3 automatically scales to handle traffic spikes and high demand without requiring manual intervention. It provides high availability and can handle millions of requests per second, ensuring the website remains accessible during traffic surges.
    
3. **High Performance**: S3 is designed for high performance and low latency. It uses a globally distributed network of edge locations for content delivery, resulting in fast page load times for users across different geographical locations.
    
4. **Simple Setup**: Setting up a website on S3 is straightforward. You can upload your website files to an S3 bucket, configure the bucket for static website hosting, and optionally enable custom domain names using Amazon Route 53.
    
5. **Integration with AWS Services**: S3 integrates well with other AWS services, enabling seamless integration with services like CloudFront for content delivery, Lambda for serverless backend processing, and AWS Certificate Manager for SSL/TLS certificates.
    

However, it's important to note that hosting a dynamic website with server-side processing or database interactions may require additional components or services. In such cases, using AWS Elastic Beanstalk, EC2, or other compute services might be more suitable.

By familiarizing yourself with these interview questions and their answers, you will be better prepared to showcase your AWS knowledge and expertise during job interviews. Stay tuned for Day 50 of the #90DaysOfDevOps Challenge, where we'll explore CI/CD pipelines on AWS.