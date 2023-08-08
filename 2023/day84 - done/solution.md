# #90DaysOfDevOps Challenge - Day 84 - DevOps Project 5 - Deploying a Netflix Clone Web Application on a Kubernetes Cluster

Welcome to Day 84 of the #90DaysOfDevOps Challenge. Today, we embark on an exciting project where we'll deploy a Netflix clone web application on a Kubernetes cluster. Let's get started!

## Project Description

The project involves deploying a Netflix clone web application on a Kubernetes cluster, a popular container orchestration platform that simplifies the deployment and management of containerized applications.

The project will require creating Docker images of the web application and its dependencies and deploying them onto the Kubernetes cluster using Kubernetes manifests. The Kubernetes cluster will provide benefits such as high availability, scalability, and automatic failover of the application. Additionally, the project will utilize Kubernetes tools such as Kubernetes Dashboard and kubectl to monitor and manage the deployed application.

Overall, the project aims to demonstrate the power and benefits of Kubernetes for deploying and managing containerized applications at scale.

## Hands-on Project: Deploying a Netflix Clone Web Application on a Kubernetes Cluster

### Pre-requisites:

1. **Install Docker**: Follow the instructions from the [Official Docker Documentation](https://docs.docker.com/engine/install/) to install Docker on your OS.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690746457101/3f8ab680-c9c6-408c-a87c-00509f7ffc7e.jpeg align="center")
    
2. **Install Kubernetes and Kubectl**: To install Kubernetes and `kubectl` in your OS, follow the steps from [my previous Kubernetes blog](https://blog.estebanmoreno.link/90daysofdevops-challenge-day-31-launching-your-first-kubernetes-cluster-with-nginx-running) or use the [official minikube documentation.](https://minikube.sigs.k8s.io/docs/start/)
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690746480044/73d55f25-fb70-4740-8103-6c9dcda440c6.jpeg align="center")
    

### Project Steps:

1. **API Key Configuration**: If the Netflix Clone web application requires an API key to fetch data, make sure to follow the instructions provided in the [README.md](https://github.com/crazy-man22/netflix-clone-react-typescript/blob/main/README.md) file of the [GitHub repository](https://github.com/crazy-man22/netflix-clone-react-typescript) to configure the API key while creating the Docker container.
    
2. **Clone the Netflix Clone Repository**: Navigate to the directory where you want to clone the Netflix Clone repository from GitHub. Use the following command to clone the repository:
    
    ```bash
    git clone https://github.com/crazy-man22/netflix-clone-react-typescript.git
    ```
    
3. **Build Docker Image**: Once you have cloned the repository, navigate to the project directory and locate the Dockerfile. Ensure that the Dockerfile specifies the necessary dependencies and configurations for your Netflix Clone web application. Build the Docker image using the following command:
    
    ```bash
    docker build --build-arg TMDB_V3_API_KEY=your_api_key_here -t netflix-clone .
    ```
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690745344952/aec6b652-304c-450c-a754-99eff958c0ed.jpeg align="center")
    
4. **Push Docker Image to DockerHub**: To push the Docker image to DockerHub, you need to have a DockerHub account and repository set up. Tag the image with your DockerHub username and repository name, and then push it using the following commands:
    
    ```bash
    docker tag netflix-clone-app:latest estebanmorenoit/netflix-clone-app:latest
    docker push estebanmorenoit/netflix-clone-app:latest
    ```
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690745412254/a0280e84-ea90-4b2e-8be5-a901af55e117.jpeg align="center")
    
5. **Create Kubernetes Deployment**: Now, create a Kubernetes Deployment manifest file (e.g., `deployment.yaml`) that describes the desired state of the Netflix Clone application. In the manifest, specify the Docker image, replica count, and any required environment variables. An example `deployment.yaml` file might look like this:
    
    ```yaml
    apiVersion: apps/v1
    kind: Deployment
    metadata:
      name: netflix-clone-deployment
    spec:
      replicas: 3
      selector:
        matchLabels:
          app: netflix-clone-app
      template:
        metadata:
          labels:
            app: netflix-clone-app
        spec:
          containers:
            - name: netflix-clone-container
              image: estebanmorenoit/netflix-clone-app:latest
              ports:
                - containerPort: 80
    ```
    
    Apply the deployment using the following command:
    
    ```bash
    kubectl apply -f deployment.yaml
    ```
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690745445808/07781411-8b53-4182-b2d6-163e375c6bb5.jpeg align="center")
    
    Verify the deployment and pods are successfully created.
    
    ```bash
    kubectl get deployments
    kubectl get pods
    ```
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690745471677/7f37f039-28f1-4094-be50-63b14e10687e.jpeg align="center")
    
6. **Create Kubernetes Service**: Next, create a Kubernetes Service manifest file (e.g., `service.yaml`) that exposes the Netflix Clone application to the outside world. The service will use a LoadBalancer type, and Minikube will assign an external load balancer that enables access to the application on a specific port. An example `service.yaml` file might look like this:
    
    ```yaml
    apiVersion: v1
    kind: Service
    metadata:
      name: netflix-clone-service
    spec:
      type: LoadBalancer
      selector:
        app: netflix-clone-app
      ports:
        - protocol: TCP
          port: 80
          targetPort: 80
          nodePort: 30080
    ```
    
    Apply the service using the following command:
    
    ```bash
    kubectl apply -f service.yaml
    ```
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690745499220/efc792f2-3287-470a-a5b1-3bad3ae18774.jpeg align="center")
    
    Verify the service has been successfully created.
    
    ```yaml
    kubectl get svc
    ```
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690745781674/12683377-b7a1-4318-a2fb-16d496968dd5.jpeg align="center")
    
7. **Testing Website Accessibility**: Use the `curl` command to check if the application is accessible. Open a terminal and run the following command:
    
    ```yaml
    minikube service netflix-clone-service --url
    ```
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690745602455/f2f1be21-05f7-4290-948d-66b3a97fff92.jpeg align="center")
    
    Copy the above URL and use the curl command to query the app. You should receive the HTML content of the Netflix Clone homepage as a response to the below command.
    
    ```yaml
    curl -L http://<your-minikube-service-ip-address>:30080
    ```
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690745633076/504a8cb3-9a73-4110-8d8d-365628c62a61.jpeg align="center")
    
8. **Access the Netflix Clone Web Application**: As we can see, the Load Balancer service called `netflix-clone-service` and its external IP assignment are pending. To access and assign the external IP, we need to create a bridge between Minikube and our machine by using a tunnel command.
    
    ```yaml
    kubectl get svc
    ```
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690745973514/27033a8f-dc63-4ef8-babe-ee082a097f6d.jpeg align="center")
    
    ```yaml
     minikube tunnel
    ```
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690746013671/21d4686f-3197-4736-a6dd-a9329fe1de35.jpeg align="center")
    
    We have to keep the tunnel running, so we are going to open a second terminal and check the status of the service again
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690746039912/7a2dc955-73c2-48e2-a45e-188dc1efcff7.jpeg align="center")
    
    We can use the External IP address and the port to access our app. You should now see the Netflix Clone web application running on the Kubernetes cluster.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1690746239555/8dc51b8f-d9fb-497a-8645-cb783ef85752.jpeg align="center")
    

Congratulations on completing Day 84 of the #90DaysOfDevOps Challenge! Today, we successfully deployed a Netflix clone web application on a Kubernetes cluster, utilizing the power of container orchestration to simplify our deployment process. Kubernetes' high availability, scalability, and automatic failover ensure that our application is robust and resilient. Tomorrow, we'll continue our #90DaysOfDevOps challenge with a new exciting project. Stay tuned!