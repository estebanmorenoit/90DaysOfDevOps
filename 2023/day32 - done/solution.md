# #90DaysOfDevOps Challenge - Day 32 - Launching your Kubernetes Cluster with Deployment

Welcome to Day 32 of the #90DaysOfDevOps challenge. After successfully launching our Kubernetes cluster with Minikube on the previous day, today we will dive deeper into Kubernetes deployments. So let's get started.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1687202568469/d9351b3b-c54c-4320-b3aa-25ea06b073c7.png)

## What is Deployment in Kubernetes?

In Kubernetes, a **Deployment** is an object that provides **declarative** updates to manage application deployments. It defines the **desired state** of the application and handles the **creation**, **scaling**, and **updating** of the application's replicas. Deployments are a key component of managing containerized applications in a Kubernetes cluster.

A Deployment ensures that the desired number of replicas of an application is running and manages the lifecycle of those replicas. It allows for rolling updates, rollback to previous versions, and scaling of the application replicas based on the defined configuration.

Deployments are often used to manage stateless applications, where each instance of the application is independent of others. They are particularly useful in scenarios where high availability, fault tolerance, and easy scaling are required.

## Benefits of Using Deployments in Kubernetes

Using Deployments in Kubernetes offers several benefits:

1. **Ease of Management**: Deployments provide a declarative way to define and manage the state of applications. You can specify the desired state of your application, and Kubernetes takes care of creating, updating, and scaling the replicas to match that state.
    
2. **Rolling Updates and Rollbacks**: Deployments support rolling updates, allowing you to update your application gradually without downtime. If an update introduces issues, you can easily roll back to a previous version of the application.
    
3. **Scalability**: Deployments enable easy scaling of your application by simply adjusting the number of replicas. This allows you to handle increased traffic or load by adding more instances of the application.
    
4. **High Availability**: Deployments ensure that the desired number of replicas are always running. If a replica fails, Kubernetes automatically replaces it to maintain the desired state and ensure high availability.
    
5. **Self-Healing**: Kubernetes continuously monitors the health of application replicas managed by a Deployment. If a replica becomes unhealthy or fails, Kubernetes automatically replaces it with a new one, ensuring the overall health of the application.
    

## Task 1 - Create one Deployment file to deploy a sample todo-app on K8s using "Auto-healing" and "Auto-Scaling" feature

1 - Create a file called `deployment.yml` and define the deployment configuration.

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: todo-app
  labels:
    app: todo
spec:
  replicas: 2
  selector:
    matchLabels:
      app: todo
  template:
    metadata:
      labels:
        app: todo
    spec:
      containers:
      - name: todo
        image: rishikeshops/todo-app
        ports:
        - containerPort: 3000
```

2 - Use the following command to apply the deployment to your Minikube cluster:

```bash
kubectl apply -f deployment.yml
```

This command will read the deployment configuration from the file and create the necessary resources on your Kubernetes cluster. Wait for the deployment to be successfully applied.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1687202963114/323c81aa-e449-409c-a56d-abaff75b72f5.jpeg)

3 - To verify that the deployment is running correctly, use the following command to get the status of the deployment:

```bash
kubectl get deployments
```

This will display a list of deployments in your cluster, including the one you just applied. Ensure that the desired number of replicas is available and that the deployment has been successfully created.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1687202993167/11e83311-cab3-4e82-a1fd-16a0ae0d4f9a.jpeg)

4 - Check the status of the pods created by the deployment using the following command:

```bash
kubectl get pods
```

You should see the pods associated with your deployment. Ensure that they are in the "Running" state.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1687203043430/38cd6df0-9768-4b27-9368-0f6cf63af096.jpeg)

Congratulations on successfully launching your Kubernetes cluster using Minikube and deploying a sample todo-app with auto-healing and auto-scaling features. By gaining hands-on experience with deployments, you have taken a significant step forward in your journey to master Kubernetes. Day 33 of the #90DaysOfDevOps challenge will build upon this foundation as we dive deeper into Kubernetes Namespaces and Services. Stay tuned!