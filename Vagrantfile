Vagrant.configure("2") do |config|
	config.vm.box = "centos/6"

  config.vm.provision "shell" do |s|
    ssh_pub_key = File.readlines("./lab_key.pub").first.strip
    s.inline = <<-SHELL
      echo #{ssh_pub_key} >> /home/vagrant/.ssh/authorized_keys
    SHELL
  end


	config.vm.define :test1 do |test1_config|
			test1_config.vm.host_name = "test1"
      test1_config.vm.network "private_network", ip:"192.168.30.1"

      test1_config.vm.provider :virtualbox do |vb|
          vb.customize ["modifyvm", :id, "--memory", "512"]
          vb.customize ["modifyvm", :id, "--cpus", "1"]
					# https://github.com/hashicorp/vagrant/issues/2519
          vb.customize ["modifyvm", :id, "--nic2", "intnet"]
      end

  		config.vm.provision "shell" do |s|
        s.inline = <<-SHELL
           sudo sh -c 'yum install -y epel-release && yum install -y python-setuptools python-devel gcc libffi-devel libffi openssl-devel && cd /usr/lib/python2.6/site-packages/ && python easy_install.py pip==9.0.3 && pip install ansible==2.5.0.0'
					 sudo sh -c 'cd /vagrant/ansible && ansible-galaxy install -c -r requirements.txt'
        SHELL
  		end
	end

	config.vm.define :test2 do |test2_config|
			test2_config.vm.host_name = "test2"
      test2_config.vm.network "private_network", ip:"192.168.30.2"
      test2_config.vm.provider :virtualbox do |vb|
          vb.customize ["modifyvm", :id, "--memory", "512"]
          vb.customize ["modifyvm", :id, "--cpus", "1"]
          vb.customize ["modifyvm", :id, "--nic2", "intnet"]
      end

  		config.vm.provision "shell" do |s|
        s.inline = <<-SHELL
					echo test2
        SHELL
			end
	end

	config.vm.define :test3 do |test3_config|
			test3_config.vm.host_name = "test3"
      test3_config.vm.network "private_network", ip:"192.168.30.3"
      test3_config.vm.provider :virtualbox do |vb|
          vb.customize ["modifyvm", :id, "--memory", "512"]
          vb.customize ["modifyvm", :id, "--cpus", "1"]
          vb.customize ["modifyvm", :id, "--nic2", "intnet"]
      end
  		config.vm.provision "shell" do |s|
        s.inline = <<-SHELL
					echo test3
        SHELL
			end
	end

end
