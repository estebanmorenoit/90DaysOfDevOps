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