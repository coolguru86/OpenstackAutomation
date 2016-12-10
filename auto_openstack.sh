# Team Members: Sanchay & Deekshitha
# Creation Date: 11/29/2016
# Version: 1.1
# Description: This script creates Vagrant File with necessary configuration in the current directory and then itriggeres Vagrant to install Centos7 on Virtual Box and also install Openstack-Newton on the Guest OS.

echo "Info: Initiating Script....."
echo -ne "#####                     (10%)\r"
sleep 1
echo -ne "#######                   (20%)\r"
sleep 1
echo -ne "##########                (30%)\r"
sleep 1
echo -ne "############              (40%)\r"
sleep 1
echo -ne "##############            (50%)\r"
sleep 1
echo -ne "################          (60%)\r"
sleep 1
echo -ne "##################        (70%)\r"
sleep 1
echo -ne "####################      (80%)\r"
sleep 1
echo -ne "######################    (90%)\r"
sleep 1
echo -ne "##########################(100%)\r"
sleep 1
echo -ne "\n"

echo "Info: Checking Present Working directory"
sleep 3
s_dir=$(pwd)
t_dir=/home/vagrant
file_name="/answer.txt"
echo "Info: Present Working Directory is $s_dir" 

vagfile=Vagrantfile

create_file () {
	echo "Info: Creating New Vagrantfile"
	echo "Vagrant.configure(\"2\") do |config|" > $vagfile
        echo "  config.vm.box = \"centos/7\"" >> $vagfile
        echo "  config.vm.network :forwarded_port, guest: 80, host: 8080" >> $vagfile
        echo "  config.vm.provision \"file\", source:\"$s_dir$file_name\", destination:\"$t_dir$file_name\"" >> $vagfile
	echo "  config.vm.provision \"shell\", path: \"open_n.sh\"" >> $vagfile
	echo "  config.vm.provider :virtualbox do |v|" >> $vagfile
        echo "  v.customize [\"modifyvm\", :id,\"--memory\", 6000]" >> $vagfile
        echo "  end" >> $vagfile
	echo "end" >> $vagfile
	
	echo "Info: $vagfile Created Successfully"
}


echo "Info: Please make sure Vagrant and VirtualBox are installed in the Host System"

echo "Info: Checking Vagrant in the Host System"

vag_ver=`vagrant --version`


if [ $? == 0 ]
	then
		echo "Info: Version Installed: $vag_ver"
else
		echo "Error: Vagrant Not Found. Exiting Script"
		exit 1
fi

echo "Info: Checking VirtualBox in the Host System"

vb_ver=`vboxmanage --version`

if [ $? == 0 ]
        then
                echo "Info: Version Installed: $vb_ver"
else
                echo "Error: VirtualBox Not Found. Exiting Script"
                exit 1
fi


echo "Info: Creating Vagrant File"

if [ -f $vagfile ]
	then
		echo "Info: $vagfile already exists"
		echo "Info: Press 1 to Overwrite Old File or Press 2 to Use Old File or Press 3 to Exit"
		read input
		if [ $input == 1 ]
			then
				create_file
		elif [ $input == 2 ]
			then
				echo "Info: Continuing Script"
		elif [ $input == 3 ]
			then
				echo "Warning: Script will now exit"
				exit 1
		else
				echo "Error: Incorrect Entry. Exiting Script"
				exit 1
		fi
else
	create_file

fi
echo "Info: Triggering $vagfile"
vagrant up
echo "Info: Vagrant Initialization Completed Successfully"			
