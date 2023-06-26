# #90DaysOfDevOps Challenge - Day 34 - Working with Services in Kubernetes

Welcome to Day 34 of the #90DaysOfDevOps Challenge. In today's challenge, we will explore the concept of services in Kubernetes and learn how they enable communication between different components within a cluster.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1687805901326/4a341bdf-1c29-44b8-98c2-e1bb40822ddf.jpeg align="center")

## What is a Service in Kubernetes?

A Service enables network access to a set of Pods in Kubernetes. Services select Pods based on their labels. When a network request is made to the service, it selects all pods in the cluster matching the service's selector, chooses one of them, and forwards the network request to it.

## Kubernetes Service vs Deployment

What's the difference between a Service and a Deployment in Kubernetes?

A deployment is responsible for keeping a set of pods running.

A service is responsible for enabling network access to a set of pods.

We could use a deployment without a service to keep a set of identical pods running in the Kubernetes cluster. The deployment could be scaled up and down and pods could be replicated. Each pod could be accessed individually via direct network requests (rather than abstracting them behind a service), but keeping track of this for a lot of pods is difficult.

We could also use a service without a deployment. We'd need to create each pod individually (rather than "all-at-once" like a deployment). Then our service could route network requests to those pods by selecting them based on their labels.

Services and Deployments are different, but they work together nicely.

## Kubernetes Service NodePort Example YAML

In this example, YAML creates a Service that is available to external network requests. We’ve specified the NodePort value so that the service is allocated to that port on each Node in the cluster.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1687368648277/705fa4b6-f11d-41fa-999b-6c94f2e842bc.png align="center")

## What do ClusterIP, NodePort, and LoadBalancer mean?

The `type` property in the Service's spec determines how the service is exposed to the network. It changes where a Service can be accessed from. The possible `type`s are ClusterIP, NodePort, and LoadBalancer

* `ClusterIP` – The default value. The service is only accessible from within the Kubernetes cluster – you can’t make requests to your Pods from outside the cluster!
    
* `NodePort` – This makes the service accessible on a static port on each Node in the cluster. This means that the service can handle requests that originate from outside the cluster.
    
* `LoadBalancer` – The service becomes accessible externally through a cloud provider's load balancer functionality. GCP, AWS, Azure, and OpenStack offer this functionality. The cloud provider will create a load balancer, which then automatically routes requests to your Kubernetes Service
    

> Credits to Matthew Palmer for the explanation [here](https://matthewpalmer.net/kubernetes-app-developer/articles/service-kubernetes-example-tutorial.html)

## Task 1 - Create a Service for your app

* Create a Service definition for your app Deployment in a YAML file.
    
    ```yaml
    apiVersion: v1
    kind: Service
    metadata:
      name: todo-app-service
      namespace: dev
    spec:
      type: NodePort
      selector:
        app: todo
      ports:
        - protocol: TCP
          port: 3000
          targetPort: 3000
    ```
    
* Apply the Service definition to your K8s (minikube) cluster using the below command.
    
    ```bash
    kubectl apply -f service.yml -n dev
    ```
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1687446571418/0e2140f8-a13d-4f7d-ab95-f57b05d50d0a.jpeg align="center")
    
* Verify that the Service is working by accessing the app using the Service's IP and Port in your Namespace
    
    ```bash
    kubectl get svc -n dev
    ```
    
    ```bash
    minikube service todo-app-service -n dev --url
    ```
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1687719417544/4e5c9865-c24e-449c-bdb6-eac5b39ed43a.jpeg align="center")
    
* We can access our pod by using the provided URL
    

## Task 2 - Create a ClusterIP Service for accessing the app from within the cluster

* Create a ClusterIP Service definition for your app Deployment in a YAML file
    

```yaml
apiVersion: v1
kind: Service
metadata:
  name: todo-app-service
  namespace: dev
spec:
  type: ClusterIP
  selector:
    app: todo
  ports:
    - protocol: TCP
      port: 3000
      targetPort: 3000
```

* Apply the ClusterIP Service definition to your K8s (minikube) cluster using the below command.
    
    ```bash
    kubectl apply -f service.yml -n dev
    ```
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1687720186429/e117016c-0d5c-4768-8964-b6b4a79d95a3.jpeg align="center")
    
* Verify that the ClusterIP Service is working by accessing the app from another Pod in the cluster in your Namespace.
    
    ```bash
    kubectl get svc -n dev
    ```
    
    ```bash
    kubectl get pods -n dev
    ```
    
    ```bash
    kubectl exec -it "pod-id" -n dev -- bash
    ```
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1687720455856/7e835d26-5cae-416f-b04e-6a8c96d0ff61.jpeg align="center")
    
* Once we've accessed the pod, we can run the curl command to access the URL and see the 'Hello, World!' HTML code.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1687720515454/77363ec8-5e99-4374-a0c8-a290764a7075.jpeg align="center")
    

## Task 3 - Create a LoadBalancer Service for accessing the app from outside the cluster

* Create a LoadBalancer Service definition for your app Deployment in a YAML file.
    
    ```yaml
    apiVersion: v1
    kind: Service
    metadata:
      name: todo-app-service
      namespace: dev
    spec:
      type: LoadBalancer
      selector:
        app: todo
      ports:
        - protocol: TCP
          port: 3000
          targetPort: 3000
    ```
    
* Apply the LoadBalancer Service definition to your K8s (minikube) cluster using the below command.
    
    ```bash
    kubectl apply -f service.yml -n dev
    ```
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1687721030629/cd5dcf87-f3ea-4c34-a734-01f7b9ef5939.jpeg align="center")
    
* Check the status of the newly created service:
    
    ```bash
    kubectl get svc -n dev
    ```
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1687804561450/970d5fc0-f437-4051-b3eb-d4124935ac33.jpeg align="center")
    
* As we can see, the Load Balancer service called "todo-app-service and its external IP assignment is in a pending state. To access and assign the external IP, we need to create a bridge between minikube and our machine by using a tunnel command.
    
    ```bash
    minikube tunnel
    ```
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1687804980994/b3ca506b-b01b-4da8-891e-e1ef080b968d.jpeg align="center")
    
* We have to keep the tunnel running, so we are going to open a second terminal and check the status of the service again
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1687805044672/d939521e-b34d-42c1-9964-562ca0519e23.jpeg align="center")
    
* We can use the External IP address and the port to access our app.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1687805635272/1f617e33-a966-45a3-b79e-dcb34f4f15c5.jpeg align="center")
    

Services are an essential component in Kubernetes that enable communication between different parts of an application. They provide a reliable and scalable way to expose and access services within a cluster. In this article, we explored the concept of services, the different types available, and how to create and access a service in Kubernetes.

Stay tuned for Day 35 of the #90DaysOfDevOps Challenge, where we will dive deeper into ConfigMaps and Secrets in Kubernetes