# https://hub.docker.com/u/mirrorgooglecontainers

docker pull xshrim/kube-apiserver-amd64:latest
docker pull xshrim/kube-controller-manager-amd64:latest
docker pull xshrim/kube-scheduler-amd64:latest
docker pull xshrim/kubernetes-dashboard-amd64:latest
docker pull xshrim/kube-proxy-amd64:latest
docker pull xshrim/pause-amd64:latest
docker pull xshrim/etcd-amd64:latest
docker pull xshrim/coredns:latest
docker tag xshrim/kube-apiserver-amd64:latest k8s.gcr.io/kube-apiserver:v1.15.1
docker tag xshrim/kube-controller-manager-amd64:latest k8s.gcr.io/kube-controller-manager:v1.15.1
docker tag xshrim/kube-scheduler-amd64:latest k8s.gcr.io/kube-scheduler:v1.15.1
docker tag xshrim/kubernetes-dashboard-amd64:latest k8s.gcr.io/kubernetes-dashboard-amd64:v1.10.1
docker tag xshrim/kube-proxy-amd64:latest  k8s.gcr.io/kube-proxy:v1.15.1
docker tag xshrim/pause-amd64:latest  k8s.gcr.io/pause:3.1
docker tag xshrim/etcd-amd64:latest  k8s.gcr.io/etcd:3.3.10
docker tag xshrim/coredns:latest k8s.gcr.io/coredns:1.3.1
docker rmi xshrim/kube-apiserver-amd64:latest
docker rmi xshrim/kube-controller-manager-amd64:latest
docker rmi xshrim/kube-scheduler-amd64:latest
docker rmi xshrim/kubernetes-dashboard-amd64:latest
docker rmi xshrim/kube-proxy-amd64:latest
docker rmi xshrim/pause-amd64:latest
docker rmi xshrim/etcd-amd64:latest
docker rmi xshrim/coredns:latest

docker pull quay.io/coreos/flannel:v0.11.0-amd64

docker pull quay.io/external_storage/nfs-client-provisioner

docker pull quay.io/kubernetes-ingress-controller/nginx-ingress-controller:0.25.0

docker pull mirrorgooglecontainers/metrics-server-amd64:v0.3.3

docker pull mirrorgooglecontainers/addon-resizer:2.3



# sudo systemctl stop firewalld

# sudo kubeadm init --ignore-preflight-errors=Swap --pod-network-cidr 10.244.0.0/16

# mkdir -p $HOME/.kube
# cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
# chown $(id -u):$(id -g) $HOME/.kube/config

# kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml

# kubectl taint nodes --all node-role.kubernetes.io/master
# kubectl taint nodes --all node.kubernetes.io/not-ready-

# # sudo kubeadm reset

# kubectl run -it --image busybox dns-test --restart=Never --rm sh

# for zsh completion
# autoload -Uz compinit
# compinit
# source <(kubectl completion zsh)
# zstyle ':completion:*' accept-exact '*(N)'
# zstyle ':completion:*' use-cache on
# zstyle ':completion:*' cache-path ~/.zsh/cache
