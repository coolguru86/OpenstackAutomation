Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"
  config.vm.network :forwarded_port, guest: 80, host: 8080
  config.vm.provision "file", source:"/Users/Pinku/Vagrant_ITC630/answer.txt", destination:"/home/vagrant/answer.txt"
  config.vm.provision "shell", path: "open_n.sh"
  config.vm.provider :virtualbox do |v|
  v.customize ["modifyvm", :id,"--memory", 6000]
  end
end
