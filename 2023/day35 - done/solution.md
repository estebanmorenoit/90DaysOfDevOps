# #90DaysOfDevOps Challenge - Day 35 - Mastering ConfigMaps and Secrets in Kubernetes

Welcome to Day 35 of the #90DaysOfDevOps challenge. Today, we will delve into the powerful concepts of ConfigMaps and Secrets in Kubernetes. As you progress in your DevOps journey, understanding how to effectively manage configuration data and sensitive information is crucial. Let's explore ConfigMaps and Secrets and learn how to leverage them in your Kubernetes deployments.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1687807846971/c0b04abf-3042-4c71-973c-4b5cbfcd99cc.webp)

## What are ConfigMaps and Secrets in Kubernetes?

In Kubernetes, ConfigMaps and Secrets are used to store configuration data and sensitive information, respectively. They provide a convenient way to manage application-specific configurations and ensure the secure handling of sensitive data within your cluster.

### ConfigMaps

ConfigMaps store configuration data as key-value pairs or as files. They act as a centralized repository for your application's configurations. Each key-value pair or file in a ConfigMap represents a specific configuration setting that can be accessed by your containers.

### Secrets

Secrets are similar to ConfigMaps but are specifically designed to handle sensitive information. They store sensitive data, such as API keys, passwords, and certificates, in an encrypted form. Secrets provide an additional layer of security by ensuring that the sensitive data is accessible only to authorized entities.

## Why Use ConfigMaps and Secrets?

By utilizing ConfigMaps and Secrets, you can achieve the following benefits:

**1\. Centralized Configuration Management**: ConfigMaps allow you to store all the necessary configuration data in a single location. This enables easy management and updates of configurations without modifying your application code or container images.

**2\. Environment Consistency**: ConfigMaps ensures that each component or container within your Kubernetes cluster receives the required configuration settings consistently. This promotes uniform behaviour across your application, simplifying troubleshooting and maintenance.

**3\. Sensitive Data Protection**: Secrets encrypt sensitive information, preventing unauthorized access. Kubernetes handles the encryption and decryption automatically, ensuring secure transmission and storage of sensitive data.

**4\. Separation of Concerns**: ConfigMaps and Secrets enable a clear separation between application configuration and sensitive information. This separation allows different teams or individuals to manage these aspects independently, improving collaboration and security.

You can read more about [ConfigMaps](https://kubernetes.io/docs/concepts/configuration/configmap/) & [Secrets](https://kubernetes.io/docs/concepts/configuration/secret/) in the Kubernetes Official Documentation.

Now that we understand the basics, let's dive into today's tasks and learn how to create ConfigMaps and Secrets for your deployments in Kubernetes.

## Task 1 - Creating a ConfigMap for Your Deployment

* Create a `configmap.yml` file and include the desired configurations.
    
    ```yaml
    apiVersion: v1
    kind: ConfigMap
    metadata:
      name: todo-configmap
      namespace: dev
    data:
      APP_NAME: "Todo App"
      ENVIRONMENT: "Development"
    ```
    
* Run the following command to create the ConfigMap:
    
    ```yaml
    kubectl apply -f configmap.yml -n dev
    ```
    
    This will create the ConfigMap named `todo-configmap` in the `dev` namespace.
    
* Update the file to include the ConfigMap reference. Add the `envFrom` field under the `containers` section of the deployment. The updated section should look like this:
    
    ```yaml
    apiVersion: apps/v1
    kind: Deployment
    metadata:
      name: todo-app
      namespace: dev
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
            image: estebanmorenoit/my-web-app
            ports:
            - containerPort: 3000
            envFrom:
            - configMapRef:
                name: todo-configmap
    ```
    
* Apply the updated deployment by running the following command:
    
    ```bash
    kubectl apply -f deployment.yml -n dev
    ```
    
    This will apply the changes to the deployment and create the associated Pods.
    
* Check the status of the deployment and ConfigMap by running the following command:
    
    ```bash
    kubectl get deployment -n dev
    kubectl get configmap -n dev
    ```
    
    This will display the status of the deployment and ConfigMap.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1687890690893/1a332344-aed0-42a6-b1cb-72613373caa9.jpeg)
    
* Use the describe command to get a detailed view of the ConfigMap
    
    ```bash
    kubectl describe configmap todo-config -n dev
    ```
    
    This will provide detailed information about the ConfigMap, including the data stored within it.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1687890757742/8329abc7-03c5-4d2d-879f-85e0d45cdba9.jpeg)
    
* Navigate inside the Pod and check the environment variable and the application for detailed status.
    
    ```bash
    kubectl exec -it <pod-name> -n dev -- sh
    ```
    
    Replace `<pod-name>` with the actual name of the Pod. This will give you access to the Pod's shell.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1687890810961/7c5ea727-d1c5-4227-a4aa-e87f42fa7151.jpeg)
    
* Inside the Pod, check the environment variables by running the following command:
    
    ```bash
    env
    ```
    
    This will display the environment variables, including the ones sourced from the ConfigMap.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1687890831541/4d29e5b2-9ac7-49cb-8b46-062b1dc21ed2.jpeg)
    
    In the output, we can find the env variables we've configured using the configmap, `APP_NAME` and `ENVIRONMENT`
    

## Task 2 - Creating a Secret for Your Deployment

Generate a Secret using a file or the command line.

* Create a `secret.yml` file and define the base64-encoded password.
    
    ```yaml
    apiVersion: v1
    kind: Secret
    metadata:
      name: todo-secret
      namespace: dev
    type: Opaque
    data:
      password: <base64-encoded-password>
    ```
    
    To add the password in the above file you need to generate the base64 encoded password.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1687892212612/b7cb57dc-5b0e-4205-bcdf-7844d40a37fa.jpeg)
    
* Run the following command to create the Secret:
    
    ```bash
    kubectl apply -f secret.yml -n dev
    ```
    
    This will create the Secret named `todo-secret` in the dev namespace.
    
* Update the `deployment.yml` file to include the Secret configuration. Add the `env` field under the `containers` section of the deployment.
    
    ```yaml
    apiVersion: apps/v1
    kind: Deployment
    metadata:
      name: todo-app
      namespace: dev
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
              image: estebanmorenoit/my-web-app
              ports:
                - containerPort: 3000
              env:
                - name: PASSWORD
                  valueFrom:
                    secretKeyRef:
                      name: todo-secret
                      key: password
    ```
    
* Apply the updated deployment by running the following command:
    
    ```bash
    kubectl apply -f deployment.yml -n dev
    ```
    
    This will apply the changes to the deployment and create the associated Pods.
    
* Check the status of the deployment and Secret by running the following command:
    
    ```bash
    kubectl get deployment -n dev
    kubectl get secret -n dev
    ```
    
    This will display the status of the deployment and Secret.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1687892620423/6359160b-513d-4676-b09d-a47d491e0ae0.jpeg)
    
* Use the describe command to get a detailed view of the Secret:
    
    ```bash
    kubectl describe secret todo-secret -n dev
    ```
    
    This will provide detailed information about the Secret.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1687892675348/9357fbb9-3066-477a-b063-77219248aef9.jpeg)
    
* Check the running Pods by running the following command:
    
    ```bash
    kubectl get pods -n dev
    ```
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1687892747440/7ad99cb0-a9cb-48da-a90a-ba5b988e2db2.jpeg)
    
* Navigate inside a Pod associated with the deployment by running the following command:
    
    ```bash
    kubectl exec -it <pod-name> -n dev -- sh
    ```
    
* Inside the Pod, view the environment variable by running the following command:
    
    ```bash
    echo $PASSWORD
    ```
    
    This will display the value of the `PASSWORD` environment variable, which is sourced from the Secret.
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1687892841643/48122835-b17a-46a0-b534-be83790b48c1.jpeg)
    

Congratulations on completing today's tasks. You have now gained valuable insights into working with ConfigMaps and Secrets in Kubernetes. Stay tuned for Day 36 of the #90DaysOfDevOps challenge, where we will explore Persistent Volumes in Your Deployment.