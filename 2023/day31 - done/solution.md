# #90DaysOfDevOps Challenge - Day 31 - Launching your First Kubernetes Cluster with Nginx running

Welcome to Day 31 of the #90DaysOfDevOps challenge. Today, we will explore the world of Kubernetes and learn how to launch our first Kubernetes cluster using Minikube. Additionally, we will deploy a Nginx pod to get hands-on experience with Kubernetes deployment.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1687116283603/cc8a1226-ee7c-4e41-b4b8-c94b33f14903.png align="center")

## What is Minikube?

**Minikube** is a powerful tool that allows us to quickly set up a **local** Kubernetes **cluster** on our macOS, Linux, or Windows machine. It offers a simplified version of Kubernetes with all its benefits, making it an ideal choice for beginners and projects in edge computing and the Internet of Things (IoT) domain.

Key Features of Minikube:

* Supports the latest Kubernetes releases, including the previous six minor versions.
    
* Cross-platform compatibility for Linux, macOS, and Windows operating systems.
    
* Flexible deployment options: VM, container, or bare-metal.
    
* Multiple container runtimes supported, including CRI-O, containerd, and Docker.
    
* Direct API endpoint for fast image load and build.
    
* Advanced features such as LoadBalancer, filesystem mounts, FeatureGates, and network policy.
    
* Add-ons for easy installation of Kubernetes applications.
    
* Integration with common CI (Continuous Integration) environments.
    

## Understanding Pods

Before we dive into deploying our first **pod**, let's understand the concept of pods in Kubernetes. Pods are the **smallest deployable units of computing in Kubernetes**. They represent a group of one or more containers that share storage and network resources. A pod contains a specification for running these containers and ensures that they are co-located and co-scheduled. In simpler terms, a pod can be thought of as an application-specific “logical host” that tightly couples one or more containers.

For a more in-depth understanding of pods, you can refer to the [Kubernetes documentation](https://kubernetes.io/docs/concepts/workloads/pods/).

## Task 1: Install Minikube on your Local Machine

* Visit the official Minikube documentation at [https://minikube.sigs.k8s.io/docs/start/](https://minikube.sigs.k8s.io/docs/start/) to access the installation instructions.
    
* Follow the installation instructions based on your operating system (macOS, Linux, or Windows) to download and install Minikube.
    
* Once the installation is complete, verify the installation by opening a terminal or command prompt and running the following command:
    

```bash
minikube version
```

If Minikube is installed correctly, you will see the version information displayed.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1687199054480/eeb7d0c7-fda6-4dd8-bdaa-03c7b452b008.jpeg align="center")

## Task 2: Creating your First Pod with Minikube

Launch your Minikube cluster by opening a terminal or command prompt and running the following command:

```bash
minikube start
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1687200032747/1c90ce3c-f1fb-44d3-a92a-b021097bd4fd.jpeg align="center")

This command will start a local Kubernetes cluster using Minikube.

Verify that your Minikube cluster is running by running the following command:

```bash
kubectl cluster-info
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1687200057673/4a5f7b6e-9f15-4078-813c-b52a345f2c18.jpeg align="center")

You should see information about your Minikube cluster, including the Kubernetes master URL.

Deploy a Nginx pod by creating the below 'pod.yml' in your workspace:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: nginx
spec:
  containers:
  - name: nginx
    image: nginx:1.14.2
    ports:
    - containerPort: 80
```

And running this command:

```bash
kubectl apply -f pod.yml
```

This command creates a pod named “nginx” and uses the official Nginx Docker image.

Verify that the Nginx pod is running by running the following commands:

```bash
kubectl get pods
kubectl describe pod nginx
```

You should see the Nginx pod listed with a status of “Running”.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1687201319827/b4601218-6349-4815-99a9-e3257cce2b2e.jpeg align="center")

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1687201370953/75dca462-7a91-4d4f-8ffc-eca9c04435bf.jpeg align="center")

Congratulations on taking the first steps towards mastering Kubernetes. Stay tuned for Day 32 of the #90DaysOfDevOps challenge, where we will continue exploring Kubernetes and dive deeper into its advanced features.