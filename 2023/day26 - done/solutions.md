# #90DaysOfDevOps Challenge - Day 26 - Jenkins Declarative Pipeline

One of the key elements in your DevOps and CI/CD journey is understanding the Declarative Pipeline Syntax of Jenkins. In this article, we'll explore the concept of pipelines, discuss the difference between Declarative and Scripted pipelines, and highlight the importance of incorporating pipelines into your development workflow.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1686769454827/48e4221d-f7b3-4db9-9378-94ff0b1729e1.webp align="center")

## Understanding Pipelines

A **pipeline** in Jenkins is a collection of **interconnected steps** or jobs that are executed **sequentially**. It provides a way to define and automate the entire software delivery process, from building and testing to deploying and releasing.

## Benefits of Using Pipelines

Implementing a Jenkins pipeline has numerous advantages, including:

* **Version Control**: Defining the pipeline in a Jenkinsfile and storing it in your project's source control repository allows for versioning and code review, treating the CD pipeline as part of your application's codebase.
    
* **Automated Builds**: By creating a Jenkinsfile, you automatically set up a pipeline build process for all branches and pull requests, ensuring consistent and reproducible builds.
    
* **Collaboration**: The pipeline code can be reviewed, modified, and iterated upon, just like any other source code. It enables collaboration between developers, testers, and operations teams, leading to better quality and faster feedback loops.
    

## Jenkinsfile

Jenkinsfile is a text file that defines the entire pipeline for a Jenkins job. It follows a specific syntax, which can be either Declarative or Scripted.

### Declarative Syntax

The declarative syntax is the recommended and more structured approach to defining pipelines in Jenkins. It provides a simplified and opinionated way to write pipelines. Here are the main sections and elements of the Declarative syntax:

1. **pipeline**: The top-level block that defines the pipeline.
    
    * **agent**: Specifies where the pipeline will run, such as on a specific agent or any available agent.
        
    * **stages**: Contains a sequence of stages that represent different phases of the pipeline.
        
        * **stage**: Defines an individual stage.
            
            * **steps**: Contains a series of steps to be executed within the stage.
                

Here's an example of a Declarative Jenkinsfile:

```bash
pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                // Build steps go here
            }
        }
        stage('Test') {
            steps {
                // Test steps go here
            }
        }
        stage('Deploy') {
            steps {
                // Deployment steps go here
            }
        }
    }
}
```

### Scripted Syntax

Scripted syntax was the original approach for writing pipelines in Jenkins and provides more flexibility and customization options. It uses a Groovy-based scripting language. Here are the main elements of the Scripted syntax:

* **node**: Specifies the agent where the pipeline will run.
    
* **stage**: Defines a stage within the pipeline.
    
* **steps**: Contains the steps to be executed within the stage.
    
* **script**: Allows for arbitrary Groovy scripting within a step.
    

Here's an example of a Scripted Jenkinsfile:

```bash
node {
    stage('Build') {
        // Build steps go here
    }
    stage('Test') {
        // Test steps go here
    }
    stage('Deploy') {
        // Deployment steps go here
    }
}
```

In the Scripted syntax, you have more flexibility to define custom logic and use Groovy constructs within the pipeline steps.

Both syntaxes allow you to define various stages, steps, and conditions to orchestrate the entire CI/CD process. You can include steps like building, testing, deploying, and triggering notifications or other actions. The choice between Declarative and Scripted syntax depends on your specific requirements, the level of customization needed, and familiarity with Groovy scripting.

## Task-01: Getting Started with Declarative Pipeline

1. Log in to your Jenkins instance and navigate to the main dashboard. Click on "New Item" to create a new job.
    
2. Provide a name for your job and select "Pipeline" as the job type. Click on "OK" to proceed.
    
3. On the job configuration page, scroll down to the "Pipeline" section. Select the "Pipeline script" option.
    
4. In the script editor, you can begin writing your Declarative Pipeline script.
    
    ```bash
    pipeline {
        agent any
        stages {
            stage('Build') {
                steps {
                    // Build steps go here
                    echo "Build Stage"
                }
            }
            stage('Test') {
                steps {
                    // Test steps go here
                    echo "Test Stage"
                }
            }
            stage('Deploy') {
                steps {
                    // Deployment steps go here
                    echo "Deploy Stage"
                }
            }
        }
    }
    ```
    
    You can customize the stages, steps, and actions according to your project requirements. Add specific commands or plugins to perform build, test, and deployment tasks.
    
5. Once you have written the pipeline script, click on "Save" to save the job configuration.
    
6. Now, you can manually trigger a build of the pipeline by clicking on the "Build Now" button. Jenkins will execute the defined stages and steps based on your script.
    
7. After the pipeline execution completes, you can view the results, logs, and status of each stage and step in the Jenkins job console.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1686768985595/3aa9fc3a-7dff-4999-bbbc-8dd1e4c2f138.jpeg align="center")
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1686768992414/d788c6a3-3f80-4769-8e27-7f27556062ea.jpeg align="center")
    

That wraps up Day 26 of the #90DaysOfDevOps challenge. During this day, we dived into the world of Jenkins Declarative Pipelines, uncovering the power and flexibility they offer in constructing robust and scalable CI/CD workflows. Stay tuned for Day 27, where we'll continue exploring Jenkins Pipelines.