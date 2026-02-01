sudo su
export DEBIAN_FRONTEND=noninteractive
apt update -y
apt install -y software-properties-common
apt-add-repository -y ppa:ansible/ansible
apt update -y
apt install -y ansible
ansible --version
