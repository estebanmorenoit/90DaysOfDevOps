# #90DaysOfDevOps Challenge - Day 45 - Deploy WordPress website on AWS

Welcome to Day 45 of the #90DaysOfDevOps Challenge. Today, we will focus on deploying a WordPress website on AWS. WordPress is a popular content management system (CMS) used by millions of websites worldwide. By leveraging AWS services like Amazon EC2 and Amazon RDS, we can set up a highly scalable and reliable WordPress environment.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688246646117/9236ac99-ea4f-40db-beb8-1fe048d986ea.jpeg)

## Overview

WordPress is a highly popular content management system (CMS) that is used [for over 30% of all sites on the internet](https://venturebeat.com/2018/03/05/wordpress-now-powers-30-of-websites/). It is most commonly used for blogs, but can also be used for running e-commerce sites, message boards, and many other popular use cases. In this guide, you will learn how to set up a WordPress site to run a blog.

## What You Will Accomplish

WordPress requires a [MySQL](https://www.mysql.com/) database to store its data.

In the modules that follow, you will see how to configure a WordPress installation using [Amazon RDS for MySQL](https://aws.amazon.com/rds/mysql/). To configure this WordPress site, you will create the following resources in AWS:

* An [Amazon EC2](https://aws.amazon.com/ec2/) instance to install and host the WordPress application
    
* An [Amazon RDS for MySQL](https://aws.amazon.com/rds/mysql/) database to store your WordPress data
    

## Why This Matters

Database maintenance for your WordPress site is critical. Your database instance holds all of your important data for your WordPress site. If the database goes down, your website may go down with it, and you could even lose your data.

Database maintenance can also be difficult, and database administrators have years of specialized experience. When setting up a WordPress site, you want to stay focused on designing your page and generating your content, not worrying about database performance and backups.

Amazon RDS for MySQL helps with both of these problems. Amazon RDS for MySQL is a managed database offering from AWS. With Amazon RDS for MySQL, you get:

* **Automated backup and recovery** so that you won’t lose data in the event of an accident
    
* **Regular updates and patches**, keeping your database secure and performant
    
* **Easy installation** with smart default parameters.
    

These features allow you to get a fast, reliable database without requiring specialized database knowledge. You can get on your way faster and start building your website.

## Task 1 - Creating an EC2 Instance and RDS Database

1. Create an Amazon RDS for MySQL database by following the steps outlined in Day 44.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688408141593/85c15bb0-975c-4889-9e9f-58d522ff8a9d.jpeg)
    
2. Launch an Amazon EC2 instance, selecting the appropriate instance type and configuration that meets the minimum system requirements for running WordPress.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688408280005/18e41c05-358a-42ad-8e54-80e7e3ec0d56.jpeg)
    
3. Configure the security group for your EC2 instance, allowing incoming traffic on port 3306 for MySQL.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688408287556/7dc49db4-1069-4ae9-b127-ae6f96a372b9.jpeg)
    
4. Connect to your EC2 instance using SSH or any preferred method of remote access.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688408669226/bdd1e698-7318-41e5-980d-cd27e455d4a5.jpeg)
    
5. Install a MySQL client to interact with the database.
    
    ```bash
    sudo yum install -y mysql
    ```
    
6. Create a environment variables `MYSQL_PASSWORD`.
    
    ```bash
    export MYSQL_PASSWORD=<your-password>
    ```
    
7. Next, run the following command in your terminal to connect to your MySQL database. Replace `“<user>"` with the master username you configure when creating your Amazon RDS database and `“<password>”` with the environment variable you create earlier.
    
    ```bash
    mysql --user=<user> --password=<password> wordpress
    ```
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688412006041/5690018b-9fae-4bca-83ac-b92b838512e0.jpeg)
    
8. Finally, create a database user for your WordPress application and give the user permission to access the `wordpress` database.
    
    ```bash
    CREATE USER 'wordpress' IDENTIFIED BY 'wordpress-pass';
    GRANT ALL PRIVILEGES ON wordpress.* TO wordpress;
    FLUSH PRIVILEGES;
    Exit
    ```
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688409760434/af544f74-338a-43f8-82bd-9ceec49f2c7d.jpeg)
    
9. Install Apache on your EC2 instance, by running the following command in your terminal:
    
    ```bash
    sudo yum install -y httpd
    ```
    
10. To start the Apache web server, run the following command in your terminal:
    
    ```bash
    sudo service httpd start
    ```
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688409870511/40376774-ab93-4007-b6ff-4a7e5b0aceab.jpeg)
    
11. Go to the EC2 Instances page and find your instance. In the Description below, find the Public IPv4 DNS of your instance. Copy and paste it into the browser:
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688409996186/cc5ae6a9-5ea5-4bb9-81b7-61b2cda894d2.jpeg)
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688410027710/c40b185c-486f-4213-9c95-c717d12fa213.jpeg)
    
12. In this step, you will download the WordPress software and set up the configuration. First, download and uncompress the software by running the following commands in your terminal:
    
    ```bash
    wget https://wordpress.org/latest.tar.gz
    tar -xzf latest.tar.gz
    ```
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688410112983/fc946e76-f989-45c0-975b-9930b8f9003f.jpeg)
    
13. If you run `ls` to view the contents of your directory, you will see a tar file and a directory called `wordpress` with uncompressed contents.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688410157868/e6a3ca86-e5c7-43f4-95be-470f1b9f71ae.jpeg)
    
14. Change the directory to the `wordpress` directory and create a copy of the default config file using the following commands:
    
    ```bash
    cd wordpress
    cp wp-config-sample.php wp-config.php
    ```
    
15. Then, open the `wp-config.php` file using the `nano` editor by running the following command.
    
    ```bash
    nano wp-config.php
    ```
    
16. You need to edit two areas of configuration. First, edit the database configuration by changing the following lines:
    
    ```bash
    // ** MySQL settings - You can get this info from your web host ** //
    /** The name of the database for WordPress */
    define( 'DB_NAME', 'database_name_here' );
    
    /** MySQL database username */
    define( 'DB_USER', 'username_here' );
    
    /** MySQL database password */
    define( 'DB_PASSWORD', 'password_here' );
    
    /** MySQL hostname */
    define( 'DB_HOST', 'localhost' );
    ```
    
    The values should be:
    
    * **DB\_NAME**: “wordpress”
        
    * **DB\_USER**: The name of the user you created in the database in the earlier step
        
    * **DB\_PASSWORD**: The password for the user you created in the earlier step
        
    * **DB\_HOST**: The hostname of the database that you found in the earlier step
        
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688411655581/fa595bd7-a882-4257-b129-fcb419c13dd2.jpeg)
    
17. The second configuration section you need to configure is the `Authentication Unique Keys and Salts`. It looks as follows in the configuration file:
    
    ```bash
    /**#@+
     * Authentication Unique Keys and Salts.
     *
     * Change these to different unique phrases!
     * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
     * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
     *
     * @since 2.6.0
     */
    define( 'AUTH_KEY',         'put your unique phrase here' );
    define( 'SECURE_AUTH_KEY',  'put your unique phrase here' );
    define( 'LOGGED_IN_KEY',    'put your unique phrase here' );
    define( 'NONCE_KEY',        'put your unique phrase here' );
    define( 'AUTH_SALT',        'put your unique phrase here' );
    define( 'SECURE_AUTH_SALT', 'put your unique phrase here' );
    define( 'LOGGED_IN_SALT',   'put your unique phrase here' );
    define( 'NONCE_SALT',       'put your unique phrase here' );
    ```
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688411010782/0a8f97e9-14cf-4495-aec6-557012c64aa5.jpeg)
    
18. In this step, you will make your Apache web server handle requests for WordPress. First, install the application dependencies you need for WordPress. In your terminal, run the following command:
    
    ```bash
    sudo amazon-linux-extras install -y lamp-mariadb10.2-php7.2 php7.2
    ```
    
19. Second, change to the proper directory by running the following command:
    
    ```bash
    cd /home/ec2-user
    ```
    
20. Then, copy your WordPress application files into the `/var/www/html` directory used by Apache.
    
    ```bash
    sudo cp -r wordpress/* /var/www/html/
    ```
    
21. Finally, restart the Apache web server to pick up the changes.
    
    ```bash
    sudo service httpd restart
    ```
    
22. You should see the WordPress welcome page and the five-minute installation process.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688411716743/e7b993c4-95fc-4bac-a4c5-0ebe0b8ae75b.jpeg)
    
23. Now it’s time for the fun part—go play with your new site. Configure the design, add pages and posts, and start getting users to your site.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688411833302/ad2fa8c2-639e-406d-a5e3-dd4ae19d4b0d.jpeg)
    

For a detailed explanation of the deployment process, you can refer to the following resource: [Deploy WordPress with Amazon RDS](https://aws.amazon.com/getting-started/hands-on/deploy-wordpress-with-amazon-rds/).

Congratulations on completing Day 45 of the #90DaysOfDevOps Challenge. Today, we successfully deployed a WordPress website on AWS, leveraging services like Amazon EC2 and Amazon RDS. Tomorrow, we will continue our journey by diving into CloudWatch alarms and SNS topic setup in AWS. Stay tuned for Day 46!