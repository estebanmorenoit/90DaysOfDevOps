# #90DaysOfDevOps Challenge - Day 44 - Relational Database Service in AWS

Welcome to Day 44 of the #90DaysOfDevOps Challenge! Today, we will explore Amazon Relational Database Service (RDS), a managed database service provided by AWS. RDS makes it easy to set up, operate, and scale a relational database in the cloud.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688243226901/2aadf899-94fe-43ca-b949-206a848ea63e.png align="center")

## Amazon Relational Database Service (RDS)

**Amazon Relational Database Service (RDS)** is a fully managed service provided by AWS that simplifies the deployment and management of relational databases. With RDS, you have the flexibility to choose from a variety of popular database engines, including MySQL, PostgreSQL, Oracle, and SQL Server.

RDS takes care of time-consuming tasks such as database setup, patching, and backups, allowing you to focus on developing and scaling your applications. It provides **automated backups**, **automatic software patching**, and **high availability options** to ensure the reliability and durability of your database.

By leveraging RDS, you can offload the burden of database administration, reduce operational complexity, and take advantage of AWS's scalable infrastructure to handle your database workloads efficiently. Whether you are running a small application or a large-scale enterprise system, RDS provides the tools and features to meet your database needs securely and reliably.

With RDS, you also benefit from additional features such as:

* **Multi-AZ deployment** for automatic failover and improved availability
    
* **Read replicas** for scaling read workloads and improving performance
    
* **Security enhancements** like encryption at rest and in-transit to protect your data
    
* **Performance monitoring** and **automated scaling** to optimize database performance
    
* **Database snapshots** for point-in-time recovery and replication across regions
    

These features empower you to build robust and scalable applications while reducing the complexity and overhead of managing your database infrastructure.

## Task 1 - Creating an RDS MySQL Instance

1. Log in to the AWS Management Console and navigate to the RDS service.
    
2. Click on "Create database" and select "MySQL" as the database engine.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688316598582/db54994c-18a1-4ee3-8896-2944fd7c3e6c.jpeg align="center")
    
3. Choose the "Free Tier" template and specify the desired configuration options, such as instance size, storage, and database engine version.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688316622607/4b6075a2-08b7-4490-917a-3d25d708f36b.jpeg align="center")
    
4. Provide a unique name for your RDS instance and set a master username and password for database access.
    
5. Configure additional settings and select 'Connect to an EC2 compute resource' in the Compute Resource, as we'll access our RDS Database from EC2. You can create the EC2 instance in this step.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688316927123/d67f0649-5ddf-43de-b145-96afbb636725.jpeg align="center")
    
6. Configure any other additional settings and click on "Create database" to initiate the creation of the RDS instance. Wait for the instance to be created and reach the "Available" state.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688317489140/5460a6e3-0c8e-4493-a8e7-2e204912d66a.jpeg align="center")
    
7. Once the EC2 instance is launched, go back to the IAM service in the AWS Management Console.
    
8. Create a new IAM role and specify the RDS access permissions for the role.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688317616510/f63fb1b2-e24b-4275-bbd6-1ef575251691.jpeg align="center")
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688317641156/dff1edb4-e184-4b36-9943-9337b87dc2e6.jpeg align="center")
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688317739037/ea3af0fd-0dcf-4dbc-b0b6-0dcac75f4e9e.jpeg align="center")
    
9. Assign the IAM role to the EC2 instance you created earlier. Navigate to your EC2 instance security settings and modify the IAM role.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688317790356/f0374612-d5aa-4a69-8834-63c875a51496.jpeg align="center")
    
10. Now, go back to the RDS service and locate your newly created RDS MySQL instance.
    
11. Obtain the hostname, port number, and credentials (username and password) from the RDS console.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688317850932/d4d06db3-6dc3-4ff2-b462-a8083e74be28.jpeg align="center")
    
12. Connect to your EC2 instance and install the MySQL client on the EC2 instance
    
    ```bash
    sudo apt update
    sudo apt install mysql-client
    ```
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688318393003/ff3c00ea-7518-45d7-99c1-f4411996c583.jpeg align="center")
    
13. Use the following command to connect to the RDS instance from the EC2 instance. Make sure port 3306 is open in the inbound rule of your EC2 Instance Security Group:
    
    ```bash
    mysql -h <RDS_HOST> -P <RDS_PORT> -u <USERNAME> -p
    ```
    
14. You should now be connected to the RDS MySQL instance from your EC2 instance and can start interacting with the database.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688318544112/8bdb3a8c-f436-4003-976d-fea8e5e3110b.jpeg align="center")
    
    By following these steps, you will be able to create an RDS MySQL instance, launch an EC2 instance, establish a secure connection between them, and access the RDS instance using the MySQL client.
    

Congratulations on completing Day 44 of the #90DaysOfDevOps Challenge. Today, we dived into the world of Relational Database Service (RDS) in AWS, learning how to create, configure, and manage scalable databases in the cloud. Tomorrow, get ready for Day 45, where we'll explore the deployment of a WordPress website on AWS. Stay tuned!