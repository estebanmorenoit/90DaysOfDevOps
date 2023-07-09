# #90DaysOfDevOps Challenge - Day 50 - Your CI/CD pipeline on AWS - Part 1 🚀 ☁

Welcome to Day 50 of the #90DaysOfDevOps Challenge! In this article, we will explore AWS CodeCommit, a fully-managed source control service, and learn how to set up a code repository on CodeCommit and clone it on your local machine. We will also cover the steps to add a new file, commit it locally, and push the changes to the CodeCommit repository. Let's dive in!

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688893611831/ece0b917-ac74-4c5a-b24c-e68c5aac8e06.png align="center")

## What is CodeCommit?

AWS CodeCommit is a **fully managed**, **secure**, and **scalable version control service** offered by **Amazon Web Services (AWS)**. It provides a **reliable** and **highly available** Git-based **repository** for **storing** and **managing** your **source code** in the **cloud**. CodeCommit offers a **secure** and **encrypted** environment, ensuring the **confidentiality** and **integrity** of your code.

One of the key benefits of using CodeCommit is its seamless **integration** with other AWS services, making it an integral part of your **CI/CD (Continuous Integration/Continuous Deployment) pipeline**. You can easily integrate CodeCommit with **AWS CodeBuild** for building and testing your applications, **AWS CodeDeploy** for automating deployment, and **AWS CodePipeline** for orchestrating the entire release process.

CodeCommit provides all the standard Git functionalities, such as **version history**, **branching**, **merging**, and **pull requests**, enabling efficient **collaboration** and **code review** among **team members**. It also supports **access controls** through **AWS Identity and Access Management (IAM)**, allowing you to define **fine-grained permissions** for repository access.

By leveraging CodeCommit, you can ensure that your code is securely stored and version-controlled in a scalable and reliable manner. It simplifies the development workflow, promotes collaboration, and enhances the overall efficiency of your software development process.

## Task 1: Set up a code repository on CodeCommit and clone it on your local

To get started with CodeCommit, follow these step-by-step instructions:

1. **Create an AWS IAM user**: First, create an IAM user with appropriate permissions to access CodeCommit. Ensure that the user has the necessary IAM policies attached, such as `AWSCodeCommitFullAccess` or custom policies granting CodeCommit access. I will use the `devops-user` IAM user we created on an earlier day of the challenge.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688919642262/aa2ce146-5a93-46e5-ae30-ac9c3b184798.jpeg align="center")
    
2. **Set up Git credentials**: In the IAM console, navigate to the IAM user you created, go to Security Credentials and generate Git credentials. These credentials will be used to authenticate your local Git client with CodeCommit.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688919736563/5a7a715c-264b-4444-8e52-f0ddc5934ffc.jpeg align="center")
    
3. **Configure Git credentials on your local machine**: On your local machine, open the terminal and execute the following command:
    
    ```bash
    git config --global credential.helper '!aws codecommit credential-helper $@'
    ```
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688921623490/ed64acbe-9a99-48a8-8b58-ce96d649099c.jpeg align="center")
    
    This command sets up the AWS CLI as a Git credential helper, allowing Git to use the credentials you generated in the previous step. We can find the full steps in the [AWS Official Documentation](https://docs.aws.amazon.com/codecommit/latest/userguide/setting-up-https-unixes.html)
    
4. **Create a CodeCommit repository**: In the AWS Management Console, navigate to the CodeCommit service. Click on "Create repository" and provide a name for your repository. You can also add a description and choose any additional settings as needed.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688919512641/428b1306-baef-4fdc-9a44-7fc5e497d2b5.jpeg align="center")
    
5. **Clone the CodeCommit repository**: After creating the repository, click on the "Clone URL" button to get the repository's HTTPS or SSH clone URL. Copy the URL to your clipboard.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688920497653/2c562c94-81ce-4ea8-8ea7-2b1d92684d4f.jpeg align="center")
    
6. **Clone the repository locally**: Open your terminal and navigate to the directory where you want to clone the repository. Execute the following command, replacing `<clone-url>` with the URL you copied:
    
    ```bash
    git clone <clone-url>
    ```
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688920471331/07121efc-84bc-43e8-b296-482dad88b22b.jpeg align="center")
    

You have now set up a code repository on CodeCommit and cloned it on your local machine.

## Task 2: Add a new file from local, commit it, and push changes to CodeCommit repository

Now that you have the CodeCommit repository cloned locally, let's proceed with adding a new file, committing it, and pushing the changes to the CodeCommit repository.

1. **Create a new file**: In your local Git repository directory, create a new file using your preferred text editor. For example, you can create a file named `localfile.txt`.
    
    ```bash
    echo "This is a test file created locally for the day 50 of the #90daysofdevops challenge" > localfile.txt
    ```
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688920886507/11afd030-075b-4c14-baa9-23ce694e9ec7.jpeg align="center")
    
2. **Add and commit the changes**: In your terminal, navigate to the repository directory and execute the following commands:
    
    ```bash
    git add .
    git commit -m "Add new_file.txt"
    ```
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688920930972/6c1b10ce-6b18-48e3-85b4-ca8e8a4256bf.jpeg align="center")
    
3. **Push changes to CodeCommit**: Finally, execute the following command to push the local changes to the CodeCommit repository:
    
    ```bash
    git push origin <branch-name>
    ```
    
    Replace `<branch-name>` with the name of the branch you want to push the changes to. If you're using the default branch, it is usually `master` or `main`.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1688920983677/70cd7676-085d-45b3-a86d-59d57c85690c.jpeg align="center")
    

You have successfully added a new file from your local machine, committed it, and pushed the changes to the CodeCommit repository.

In this article, we covered the basics of AWS CodeCommit and walked through the process of setting up a code repository on CodeCommit, cloning it locally, and performing Git operations such as adding a new file, committing changes, and pushing them back to the repository. Stay tuned for day 51 of this series, where we will explore more advanced concepts of CI/CD pipelines on AWS.