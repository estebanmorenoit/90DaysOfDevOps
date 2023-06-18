# #90DaysOfDevOps Challenge - Day 30 - Kubernetes Architecture

Welcome to Day 30 of the #90DaysOfDevOps challenge. Today, we will explore the architecture of Kubernetes, one of the most widely used container orchestration platforms. In this article, we will provide an overview of Kubernetes, discuss its benefits, explain its architecture, and answer some key questions related to this powerful tool.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1687092567142/5e056af5-d4a2-4155-9019-46ea27668eab.jpeg align="center")

## 1 - What is Kubernetes?

With the increasing adoption of containerization technology, organizations have been looking for efficient ways to deploy and manage containerized applications. This is where Kubernetes comes in. Kubernetes, also known as K8s, is an open-source container orchestration platform developed by Google. It is designed to automate the deployment, scaling, and management of containerized applications.

Kubernetes builds upon Google's experience of managing large-scale containerized workloads with its internal system called Borg. It takes inspiration from Borg's concepts and best practices, making Kubernetes a robust and battle-tested platform for managing containers.

The primary goal of Kubernetes is to abstract the underlying infrastructure and provide a unified API for managing containerized applications across multiple hosts or cloud providers. It enables developers and operations teams to focus on application logic and scalability without worrying about the underlying infrastructure complexities.

Kubernetes provides a rich set of features and functionalities that make it a powerful tool for DevOps teams. It offers automatic scaling, load balancing, self-healing, service discovery, and rolling updates, among other capabilities. With Kubernetes, you can efficiently manage containers at scale, ensure high availability, and optimize resource utilization.

## 2 - What are the benefits of using k8s?

Using Kubernetes (k8s) offers several benefits:

* **Scalability**: Kubernetes enables horizontal scaling of applications by automatically distributing workloads across multiple containers. It can dynamically scale the number of containers based on demand, ensuring optimal resource utilization and responsiveness to traffic spikes.
    
* **High Availability**: Kubernetes provides self-healing capabilities by automatically monitoring the health of containers and nodes. It can detect failures and automatically restart or replace containers to maintain the desired state. This ensures high availability and reduces downtime.
    
* **Portability**: Kubernetes is platform-agnostic and supports various cloud providers and infrastructure environments. It provides a consistent API and runtime environment, allowing applications to be easily deployed and migrated across different platforms without vendor lock-in.
    
* **Resource Efficiency**: Kubernetes optimizes resource allocation and utilization. It allows you to define resource requirements and limits for containers, ensuring that applications have the necessary resources while efficiently utilizing available computing power. This helps in cost optimization and improved efficiency.
    
* **Service Discovery and Load Balancing**: Kubernetes has built-in mechanisms for service discovery and load balancing. It assigns unique IP addresses and DNS names to containers, making it easy to discover and communicate with services. Load balancing evenly distributes network traffic across containers to ensure scalability and reliability.
    
* **Extensibility and Ecosystem**: Kubernetes has a vibrant ecosystem and supports a wide range of extensions, plugins, and integrations. It provides a rich set of APIs and interfaces, allowing developers to extend its functionality and integrate it with other tools and platforms.
    

## 3 - Explain the architecture of Kubernetes

The architecture of Kubernetes consists of several key components that work together to manage and orchestrate containers. See a brief overview here:

* **Master Node**: The master node is responsible for managing the overall cluster and its components. It includes several key components:
    
    * **API Server**: The API server acts as the central control point for communication and management of the cluster. It exposes the Kubernetes API, which allows users and other components to interact with the cluster.
        
    * **Scheduler**: The scheduler assigns containers to available worker nodes based on resource requirements, constraints, and policies. It ensures efficient resource utilization and distribution of workloads across the cluster.
        
    * **Controller Manager**: The controller manager oversees the cluster's desired state and manages various controllers that handle tasks such as node and pod lifecycle management, replication, and scaling.
        
    * **etcd**: etcd is a distributed key-value store used for storing and replicating the cluster's configuration data. It provides a consistent and reliable data store for maintaining the cluster's state.
        
* **Worker Nodes**: Worker nodes, also known as minion nodes, are responsible for running containers and handling the actual workload. Each worker node consists of the following components:
    
    * **Kubelet**: The kubelet is an agent that runs on each worker node and communicates with the master node. It is responsible for managing and monitoring containers on the node, ensuring they are in the desired state.
        
    * **Container Runtime**: The container runtime, such as Docker or containerd, is responsible for pulling and running container images on the node. It provides the necessary isolation and runtime environment for containers.
        
    * **Kube Proxy**: The kube proxy is responsible for network communication and load balancing between containers. It routes traffic to the appropriate containers based on service discovery and load balancing rules.
        

## 4 - What is Control Plane?

The Control Plane is the central management component of Kubernetes. It consists of several key components that collectively manage the cluster and its resources. The Control Plane components run on the master node and are responsible for making global decisions about the cluster state, scheduling workloads, monitoring health, and maintaining the desired configuration.

The Control Plane components include the API server, scheduler, controller manager, and etcd. These components work together to ensure the cluster operates as intended, maintaining the desired state and responding to changes in the environment.

## 5 - Difference between `kubectl` and `kubelets`

* **kubectl**: `kubectl` is a command-line tool used to interact with Kubernetes clusters. It allows users to manage and control the cluster, deploy applications, inspect and manage resources, and perform various administrative tasks. `kubectl` communicates with the Kubernetes API server to execute commands and retrieve information about the cluster and its components. It is primarily used by administrators, developers, and operators to manage and troubleshoot the cluster.
    
* **kubelet**: `kubelet` is a component that runs on each worker node in the Kubernetes cluster. It is responsible for the management and execution of containers on the node. `kubelet` receives instructions from the master node, monitors the state of containers, and ensures they are running correctly. It interacts with the container runtime (e.g., Docker) to start, stop, and manage containers based on the desired state specified by the Control Plane. `kubelet` plays a critical role in maintaining the health and stability of containers on the worker nodes.
    

In summary, `kubectl` is a command-line tool used for cluster management and administration, while `kubelet` is a component that runs on worker nodes and manages container execution on those nodes.

## 6 - Explain the role of the API server

The API server is a key component of the Kubernetes Control Plane. It acts as the primary interface for interacting with the Kubernetes cluster. The API server exposes the Kubernetes API, which provides a set of endpoints and resources that allow users, administrators, and other components to interact with the cluster.

The role of the API server includes:

* **Authentication and Authorization**: The API server handles authentication and authorization of requests. It verifies the identity of users or components making requests and determines their level of access and permissions.
    
* **Cluster Management**: The API server is responsible for managing the cluster's resources, including nodes, pods, services, deployments, and other objects. It validates and processes incoming requests related to resource creation, modification, and deletion.
    
* **Event Handling**: The API server generates and handles events related to changes in the cluster's state. It emits events when resources are created, modified, or deleted, allowing users and components to monitor and react to changes.
    
* **Data Storage**: The API server stores the cluster's configuration data, including resource definitions and object specifications. It stores this information in a distributed key-value store called etcd, ensuring consistency and replication across the cluster.
    
* **Communication**: The API server acts as the central point of communication for the cluster. It receives incoming requests from users, components, and external systems, and routes them to the appropriate components within the cluster.
    

The API server is a critical component that enables the management, control, and interaction with the Kubernetes cluster. It provides a unified and secure interface for managing the cluster's resources and allows users and components to leverage the full power of Kubernetes.

Congratulations on completing Day 30 of the #90DaysOfDevOps challenge. In this article, we dived into the Kubernetes architecture. We discussed the definition and significance of Kubernetes, its benefits in orchestrating containerized applications, etc. With this knowledge, we're now equipped to dive deeper into the world of Kubernetes and leverage its power for managing your containerized applications. Stay tuned!