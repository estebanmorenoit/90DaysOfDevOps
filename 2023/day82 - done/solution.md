# #90DaysOfDevOps Challenge - Day 82 - DevOps Project 3 - Static Website using AWS S3

Welcome to Day 82 of the #90DaysOfDevOps challenge. Today's project involves hosting a static website using Amazon S3, a powerful and cost-effective object storage service provided by Amazon Web Services (AWS). Let's dive into the details of today's project!

## Project Description

**Amazon S3** (*Simple Storage Service*) is a highly **scalable** and reliable **object storage service** offered by **AWS**. It allows you to **store** and **retrieve** any amount of data from **anywhere** on the web. In this project, we will leverage the capabilities of **AWS S3** to host a **static website**. Unlike dynamic websites, which require server-side processing and databases, static websites consist of **HTML**, **CSS**, **JavaScript**, and other client-side files that can be directly served to visitors.

The main objectives of this project are as follows:

1. **Upload the website files to an S3 bucket**: We will create a new S3 bucket and upload the static website files to it. These files can include **HTML** pages, **CSS** stylesheets, **JavaScript** scripts, images, and other assets.
    
2. **Configure the S3 bucket as a static website**: S3 provides a feature to turn a bucket into a static website by enabling website hosting. Once configured, the bucket will act as a web server, serving the static content directly to visitors.
    
3. **Set up appropriate permissions**: We'll define the necessary permissions to ensure public access to the static website. This will allow anyone with the website URL to view the content.
    
4. **Ensure cost-effectiveness and scalability**: AWS S3 is known for its cost-effectiveness and scalability, making it an ideal choice for hosting static websites.
    

Now that we have a clear understanding of the project's objectives, let's proceed with the step-by-step resolution of the project.

## Hands-on Project: Hosting a Static Website on AWS S3

### Step 1: Create an S3 Bucket

1. Log in to your AWS Management Console.
    
2. Navigate to the S3 service by clicking on "Services" in the top-left corner and selecting "S3" under the "Storage" section.
    
3. Click on the "Create Bucket" button.
    
4. Choose a unique bucket name that reflects your website (e.g., my-static-website).
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690467004405/73d97224-5636-4120-bedb-10140610e38e.jpeg align="center")
    
5. Select the appropriate region for your website's audience (choose the region closest to your target audience for better performance).
    
6. Leave other settings as default or adjust them as needed.
    
7. Click on "Create Bucket" to create your S3 bucket.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690467025577/b768801a-77f8-4f26-a5f5-1deeda156162.jpeg align="center")
    

### Step 2: Upload Website Files

1. Once the S3 bucket is created, click on its name to open the bucket details.
    
2. Click on the "Upload" button to upload your website files. I will be using my [portfolio website](https://github.com/estebanmorenoit/estebanmoreno-portfolio).
    
3. Drag and drop or choose the files from your local system.
    
4. Make sure to include your HTML, CSS, JavaScript, images, and any other assets required for the website.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690467278159/8696ab4c-b47b-40fe-be37-a41e09f25ff2.jpeg align="center")
    

### Step 3: Configure the S3 Bucket for Website Hosting

1. In the bucket properties, navigate to the "Static website hosting" section.
    
2. Select the "Use this bucket to host a website" option.
    
3. For the "Index document," enter the filename of your default homepage (usually "index.html").
    
4. For the "Error document," enter the filename of your custom error page (optional, usually "error.html" or "404.html").
    
5. Click on "Save changes" to enable website hosting for the bucket.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690470287371/8e525ba6-8f66-4156-b4a9-098922e0d6ac.jpeg align="center")
    

### Step 4: Edit S3 Block Public Access settings and Set Bucket Policy for Public Access

1. In the bucket properties, navigate to the "Permissions" tab.
    
2. Under Block public access (bucket settings), choose Edit.
    
3. Clear Block *all* public access, and choose Save changes.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690471745334/f109658d-e72e-4e2c-b466-9195b4e2dd59.jpeg align="center")
    
4. Under Bucket Policy, choose Edit.
    
5. To grant public read access to your website, copy the following bucket policy, and paste it into the Bucket policy editor.
    
    ```bash
    {
        "Version": "2012-10-17",
        "Statement": [
            {
                "Sid": "PublicReadGetObject",
                "Effect": "Allow",
                "Principal": "*",
                "Action": [
                    "s3:GetObject"
                ],
                "Resource": [
                    "arn:aws:s3:::Bucket-Name/*"
                ]
            }
        ]
    }
    ```
    
6. Click on "Save" to apply the bucket policy, allowing public read access to objects in the bucket.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690471918537/60d498a8-4674-4369-8027-f594fc875af3.jpeg align="center")
    

### Step 5: Test and Verify

1. Test your website by accessing the S3 bucket endpoint (e.g., [my-static-website.s3.amazonaws.com](http://my-static-website.s3.amazonaws.com)) in a web browser.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690472182052/68ad771c-33c4-47f1-a6cb-308a5738893b.jpeg align="center")
    
2. You should be able to see your static website live and accessible to the public.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690472209207/898deb2f-76b7-4315-aa31-9d451d031c5b.jpeg align="center")
    

Congratulations on completing Day 82 of the #90DaysOfDevOps challenge. Today's project allowed us to explore the power of Amazon S3 for hosting static websites. We learned how to create an S3 bucket, upload website files, et up permissions for public access and configure it as a static website. Stay tuned for a new project on Day 83 of the #90daysofdevops challenge!