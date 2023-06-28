# #90DaysOfDevOps Challenge - Day 36 - Managing Persistent Volumes in Your Deployment

Welcome to Day 36 of the #90DaysOfDevOps challenge. In today's challenge, we will explore how to manage Persistent Volumes in your Kubernetes deployment. **Persistent Volumes (PVs)** provide a powerful mechanism to store and manage data that needs to persist beyond the lifecycle of a Pod. Let's dive in and master this important aspect of Kubernetes.

## What are Persistent Volumes in Kubernetes?

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1687943746784/46499e02-1b40-496a-9c74-e2a3c1f373ad.png align="center")

**Persistent Volumes (PVs)** in Kubernetes are a vital component for managing storage in containerized environments. They provide a **reliable and persistent storage** solution for applications running in Kubernetes clusters.

PVs act as an abstraction layer that separates the details of the underlying storage infrastructure from the application. This allows administrators to manage storage resources independently, providing flexibility and scalability.

With PVs, administrators can define and allocate storage resources to applications based on their specific requirements. PVs support different storage types, including local storage, network-attached storage (NAS), and cloud-based storage solutions.

The lifecycle of a PV is decoupled from the lifecycle of a pod, meaning that **data stored in a PV is preserved** even if the pod is terminated or rescheduled. This is especially important for stateful applications that require data persistence.

To use a PV, applications create **Persistent Volume Claims (PVCs)** that request storage resources. The PVCs are then bound to available PVs based on their capacity, access modes, and other specified criteria. This dynamic provisioning allows for efficient resource utilization and simplifies the process of allocating storage to applications.

Once a PV is bound to a PVC, the application can access the storage as a mounted volume. This allows data to be read from and written to the storage by the application running inside the pod.

Monitoring and managing PVs can be done using Kubernetes commands and tools. Administrators can view the status of PVs, track resource utilization, and perform maintenance tasks such as resizing or deleting PVs.

In summary, Persistent Volumes in Kubernetes provide a powerful mechanism for managing storage in containerized environments. They ensure **data availability**, enable **data persistence** for stateful applications, and offer **flexibility** in choosing storage solutions. By leveraging PVs, administrators can optimize **resource allocation**, enhance **application performance**, and simplify **storage management** in Kubernetes clusters.

## Task 1 - Adding a Persistent Volume to your Deployment

Follow these steps to add a Persistent Volume to your Deployment:

1. Create a Persistent Volume (PV):
    
    ```yaml
    apiVersion: v1
    kind: PersistentVolume
    metadata:
      name: nginx-pv-volume
    spec:
      storageClassName: standard
      capacity:
        storage: 1Gi
      accessModes:
        - ReadWriteOnce
      hostPath:
        path: "/mnt/nginx"
    ```
    
2. Run the Persistent Volume file on the server using the `kubectl` command:
    
    ```bash
    kubectl apply -f pv.yml -n dev
    ```
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1687976218914/a10a4e6f-9d68-465b-bb0b-3b03ba3efc74.jpeg align="center")
    
3. Create a Persistent Volume Claim (PVC) file with the required configurations:
    
    ```yaml
    apiVersion: v1
    kind: PersistentVolumeClaim
    metadata:
      name: nginx-pv-claim
    spec:
      storageClassName: standard
      accessModes:
        - ReadWriteOnce
      resources:
        requests:
          storage: 500Mi
    ```
    
4. Run the Persistent Volume Claim file on the server:
    
    ```bash
    kubectl apply -f pvc.yml -n dev
    ```
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1687977625259/09d47559-3392-4c57-80ed-ac6bdf39dcad.jpeg align="center")
    
5. Update the deployment file to include the necessary configurations to attach the Persistent Volume:
    
    ```yaml
    apiVersion: apps/v1
    kind: Deployment
    metadata:
      name: nginx-pv-deployment
    spec:
      replicas: 2
      selector:
        matchLabels:
          app: nginx
      template:
        metadata:
          labels:
            app: nginx
        spec:
          containers:
            - name: nginx-container
              image: nginx
              ports:
                - containerPort: 80
                  name: "http-server"
              volumeMounts:
                - mountPath: "/usr/share/nginx/html"
                  name: nginx-storage
              resources:
                limits:
                  memory: 512Mi
                  cpu: "1"
                requests:
                  memory: 256Mi
                  cpu: "0.2"
          volumes:
            - name: nginx-storage
              persistentVolumeClaim:
                claimName: nginx-pv-claim
    ```
    
6. Apply the updated deployment file on the server:
    
    ```bash
    kubectl apply -f deployment.yml -n dev
    ```
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1687977706816/867b4131-0ab5-4c20-8496-ebf5c9b9134a.jpeg align="center")
    
7. Check the running Pods on the server to ensure the changes have taken effect:
    
    ```bash
    kubectl get pods -n dev
    ```
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1687977023867/44c3bafd-3e57-4637-8eef-56de5116286d.jpeg align="center")
    
8. Verify the status of the Persistent Volume running on the server:
    
    ```bash
    kubectl get pv -n dev
    ```
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1687977547546/9dbd8232-b7fd-4e1f-a977-c20038bd0725.jpeg align="center")
    

## Task 2 - Accessing data in the Persistent Volume

After adding a Persistent Volume to your deployment, it's important to ensure that you can access the data stored in it. Follow these steps:

1. Connect to a Pod in your deployment using the command:
    
    ```bash
    kubectl exec -it <pod-name> -n dev -- sh
    ```
    
    This will open an interactive shell within the Pod. Create a test file in the persistent volume to test it:
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1687977217152/6b5a201f-1faf-42ba-9822-5195b31bfc95.jpeg align="center")
    
2. To ensure a clean state, delete the existing pod by deleting the deployment. Then, after reapplying the deployment, verify if the file in the newly created pod is successfully generated.
    
    ```bash
    kubectl delete -f deployment.yml -n dev
    kubectl get pods -n dev
    ```
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1687977343707/c2b0ac7d-ff20-491b-b480-6b88e0bcf27c.jpeg align="center")
    
    This step ensures that the deployment process is properly updating and managing the pods within your Kubernetes cluster.
    

By completing these tasks, you will gain valuable hands-on experience in managing Persistent Volumes in your Kubernetes deployment. Stay tuned for Day 37 of the #90DaysOfDevOps challenge, where we will dive into some useful Kubernetes Interview Questions.