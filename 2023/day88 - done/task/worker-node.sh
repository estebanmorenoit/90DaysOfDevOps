# Run these commands as root or use "sudo su" to switch to the root user on the Worker Node.
sudo su
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
kubeadm join <master_node_ip>:6443 --token <token> --discovery-token-ca-cert-hash sha256:<hash> --v=5