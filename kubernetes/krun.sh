#!/bin/bash
firewall_status=""
docker_status=""
kubelet_status=""

serviceStatus() {
    firewall_status=$(sudo systemctl is-active firewalld)
    docker_status=$(sudo systemctl is-active docker)
    kubelet_status=$(sudo systemctl is-active kubelet)
}

serviceStatus

if [[ "$1" == "start" ]];
then
    if [[ $firewall_status == "active" ]];
    then
        sudo systemctl stop firewalld
    fi
    
    if [[ $docker_status == "inactive" ]];
    then
        sudo systemctl start docker
    fi
    
    if [[ $kubelet_status == "inactive" ]];
    then
        sudo systemctl start kubelet
    fi
    
    serviceStatus
    
    if [[ $firewall_status == "inactive" && $docker_status == "active" && $kubelet_status == "active" ]];
    then
        echo "Success"
    else
        echo "Failed"
    fi

else
    if [[ $firewall_status == "inactive" ]];
    then
        sudo systemctl start firewalld
    fi
    
    if [[ $kubelet_status == "active" ]];
    then
        sudo systemctl stop kubelet
    fi
    
    if [[ $docker_status == "active" ]];
    then
        sudo systemctl stop docker
    fi
    
    serviceStatus
    
    if [[ $firewall_status == "active" && $docker_status == "inactive" && $kubelet_status == "inactive" ]];
    then
        echo "Success"
    else
        echo "Failed"
    fi

fi
