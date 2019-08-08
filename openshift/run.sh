# kubernetes
# udo kubeadm init --ignore-preflight-errors=Swap --pod-network-cidr 10.244.0.0/16

# https://www.jianshu.com/p/77ef3c107580
# minishift delete --force 
# rm -rf ~/.minishift/machines/minishift-state.json

#minishift
# minishift start
minishift start --vm-driver=virtualbox --registry-mirror=https://docker.mirrors.ustc.edu.cn

# oc
oc cluster up
#oc cluster down

# set firewall
sudo firewall-cmd --permanent --new-zone dockerc
sudo firewall-cmd --permanent --zone dockerc --add-source 172.17.0.0/16
sudo firewall-cmd --permanent --zone dockerc --add-port 8443/tcp
sudo firewall-cmd --permanent --zone dockerc --add-port 53/udp
sudo firewall-cmd --permanent --zone dockerc --add-port 8053/udp
sudo firewall-cmd --reload
# or sudo systemctl stop firewall-cmd

# set proxy
mkdir -p /etc/systemd/system/docker.service.d
sudo vim /etc/systemd/system/docker.service.d/http-proxy.conf
#[Service]
#Environment="HTTP_PROXY=http://127.0.0.1:8118/" "HTTPS_PROXY=https://127.0.0.1:8118/" "NO_PROXY=localhost,127.0.0.1,172.30.1.1,http://f1361db2.m.daocloud.io"
sudo systemctl daemon-reload
sudo systemctl restart docker
