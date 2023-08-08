# #90DaysOfDevOps Challenge - Day 88 - DevOps Project 9 - Deploying Django To-do App on AWS EC2 with Kubernetes Cluster

Welcome to Day 88 of the #90DaysOfDevOps Challenge. Today, we have an exciting project ahead where we will be deploying a Django Todo app on AWS EC2 using a Kubeadm Kubernetes cluster. Let's get started!

## Project Description

In this project, our goal is to deploy a Django Todo app on AWS EC2 using a Kubernetes cluster created with Kubeadm. Kubernetes provides us with a scalable and fault-tolerant environment for running our applications, ensuring that they can handle varying loads and recover from failures automatically.

Before we start, you can access the Django Todo app's source code from [GitHub](https://github.com/LondheShubham153/django-todo-cicd). Take some time to explore the code and understand how the app is structured and what it does.

## Hands-on Project: Deploying Django Todo App on AWS EC2 with Kubernetes Cluster

## Pre-requisites

Before we dive into the project, let's ensure we have the necessary pre-requisites set up:

1. Create two AWS EC2 servers with t2.medium configuration. One will be referred to as the master server, and the other as the node server.
    
2. Install Docker on both servers.
    

Now, let's proceed with the project steps:

## Project Steps

### Step 1: Clone the GitHub Repository

Begin by obtaining the Django Todo app from the GitHub repository provided. Clone it to your local environment or the AWS EC2 instance where we will set up the Kubernetes cluster.

```bash
git clone https://github.com/LondheShubham153/django-todo-cicd.git
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1691066740280/6a10fea3-306f-4eb1-b5d5-99a5530b19fc.jpeg align="center")

### Step 2: Setup the Kubernetes Cluster

To set up the Kubernetes cluster, we will use the following scripts:

**Master Node Setup:**

```bash
# Run these commands as root or use "sudo su" to switch to the root user.

# Update package lists
apt update -y

# Install Docker
apt install docker.io -y

# Start and enable Docker service
systemctl start docker
systemctl enable docker

# Add the Kubernetes repository and update package lists
curl -fsSL "https://packages.cloud.google.com/apt/doc/apt-key.gpg" | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/kubernetes-archive-keyring.gpg
echo 'deb https://packages.cloud.google.com/apt kubernetes-xenial main' > /etc/apt/sources.list.d/kubernetes.list
apt update -y

# Install specific versions of kubeadm, kubectl, and kubelet
apt install kubeadm=1.20.0-00 kubectl=1.20.0-00 kubelet=1.20.0-00 -y

# Initialize the Kubernetes cluster on the Master Node
kubeadm init

# Set up Kubernetes configuration
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

# Apply a Weave networking addon to enable communication between pods
kubectl apply -f https://github.com/weaveworks/weave/releases/download/v2.8.1/weave-daemonset-k8s.yaml

# Generate the join command for the Worker Node
kubeadm token create --print-join-command
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1691066503170/6b7cfb40-7d42-4d5a-89d3-a30314d4c7fc.jpeg align="center")

**Worker Node Setup:**

```bash
# Run these commands as root or use "sudo su" to switch to the root user on the Worker Node.

apt update -y
apt install docker.io -y

systemctl start docker
systemctl enable docker

curl -fsSL "https://packages.cloud.google.com/apt/doc/apt-key.gpg" | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/kubernetes-archive-keyring.gpg
echo 'deb https://packages.cloud.google.com/apt kubernetes-xenial main' > /etc/apt/sources.list.d/kubernetes.list

apt update -y
apt install kubeadm=1.20.0-00 kubectl=1.20.0-00 kubelet=1.20.0-00 -y

# Reset the Worker Node (if already initialized)
kubeadm reset

# Paste the join command generated from the Master Node and append "--v=5" at the end to enable verbose output during join
kubeadm join 172.31.0.238:6443 --token k25546.pwa4h1tl0jo314vx \
    --discovery-token-ca-cert-hash sha256:1437e8d77dcdc081c48cadcc2d9c16e4773b399d534dc5eb71a8ccb19d080fdf --v=5
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1691066684019/2a1f4e04-574c-4dad-bcaa-147aff403976.jpeg align="center")

Remember to replace `<master_node_ip>`, `<token>`, and `<hash>` in the Worker Node commands with the appropriate values obtained from the Master Node. After successfully joining the Worker Node to the cluster, it will be visible in the Master Node's list of nodes when you run the command `kubectl get nodes`.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1691066708892/f245fcf3-4f7f-46f4-aff5-bdbc74a2d149.jpeg align="center")

### Step 3: Setup Deployment and Service for Kubernetes

Now that the Kubernetes cluster is up and running, we can deploy our Django Todo app. Write the Deployment and Service YAML files for the Django app. Define the necessary replicas, container images, ports, and other configurations in the YAML files.

Apply the YAML files to create the Deployment and Service.

**Deployment.yaml:**

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: django-todo-app-deployment
spec:
  replicas: 2
  selector:
    matchLabels:
      app: django-todo-app
  template:
    metadata:
      labels:
        app: django-todo-app
    spec:
      containers:
        - name: django-todo-app
          image: estebanmorenoit/django-notes-app:latest
          ports:
            - containerPort: 80
```

```bash
# Apply the Deployment YAML
kubectl apply -f deployment.yaml
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1691067231365/35d6be67-6a48-4fb7-9979-58e09a91d102.jpeg align="center")

**Service.yaml**

```yaml
apiVersion: v1
kind: Service
metadata:
  name: django-todo-app-service
spec:
  type: NodePort
  selector:
    app: django-todo-app
  ports:
    - protocol: TCP
      port: 80
      targetPort: 80
      nodePort: 30080
```

```bash
# Apply the Service YAML
kubectl apply -f service.yaml
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1691067357467/48368830-61c3-4c49-9cec-36e664f020ff.jpeg align="center")

### Step 4: Run the Project

With the Kubernetes Deployment and Service set up, your Django Todo app should now be accessible through the specified port on the master server. You can access it using the public IP or DNS name of the master server.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1691078561268/60d67288-a354-4424-bdfc-c5c2048f272c.jpeg align="center")

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1691078856193/d67010db-370d-44b0-ac65-38048b8428d0.jpeg align="center")

### Conclusion

Congratulations on completing Day 88 of the #90DaysOfDevOps challenge! You have successfully deployed a Django Todo app on AWS EC2 using a Kubeadm Kubernetes cluster. Kubernetes provides a powerful platform for managing containerized applications, offering auto-scaling and auto-healing capabilities to ensure your app's availability and reliability. Stay tuned for tomorrow's challenge, where we will explore another exciting DevOps project!