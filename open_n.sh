# Team Members: Sanchay & Deekshitha
# Created Date: 11/29/2016
# Version: 1.1
# Description: This script is used by Vagrantfile to install Openstack-Newton on CentOS7

echo "Info: Initiating openstack installation script"
sleep 3

#echo "Info: Changing to root user"
#sudo -i

echo "Info: Moving File answer.txt from Vagrant Home Directory to Root Directory"

cp /home/vagrant/answer.txt /root

echo "Info: File Moved Successfully"

echo "Info: Configuring Network Settings"

sudo systemctl disable firewalld
sudo systemctl stop firewalld
sudo systemctl disable NetworkManager
sudo systemctl stop NetworkManager
sudo systemctl enable network
sudo systemctl start network

echo "Info: Network Settings Configured Successfully"

echo "Info: Downloading and Installing RDO repository RPM to setup Openstack Repository"
sudo yum install -y https://rdoproject.org/repos/rdo-release.rpm

echo "Info: Installing Openstack-Newton"
sudo yum install -y centos-release-openstack-newton

echo "Info: Updating Current Packages"
sudo yum update -y

echo "Info: Installing Packstack"
sudo yum install -y openstack-packstack

echo "Info: Running Packstack to Install Openstack"
sudo packstack --answer-file=answer.txt

echo "Info: Script Executed Successfully"

