Vagrant.configure("2") do |config|
  config.vm.define "honeypot" do |honeypot|
    honeypot.vm.box = "ubuntu/focal64"
    honeypot.vm.network "private_network", ip: "192.168.56.100"
    honeypot.vm.provider :virtualbox do |vb|
        vb.customize ['modifyvm', :id,'--nicpromisc2', 'allow-all']
    end
    honeypot.vm.provision "shell", inline: <<-SHELL
    apt-get update && apt-get install -y net-tools git libevent-dev libdumbnet-dev libpcap-dev libpcre3-dev libedit-dev bison flex libtool automake zlib1g-dev make python
    git clone https://github.com/DataSoft/Honeyd.git
    cd Honeyd
    bash autogen.sh
    bash configure
    make
    make install
    SHELL
  end

  config.vm.define "nmap_scanner" do |nmap_scanner|
    nmap_scanner.vm.box = "ubuntu/focal64"
    nmap_scanner.vm.network "private_network", ip: "192.168.56.200"
    nmap_scanner.vm.provider :virtualbox do |vb|
        vb.customize ['modifyvm', :id,'--nicpromisc2', 'allow-all']
    end
    nmap_scanner.vm.provision "file", source: "scripts/start_nmap_scanner.sh", destination: "~/start_nmap_scanner.sh"
    nmap_scanner.vm.provision "shell", inline: <<-SHELL
    apt-get update && apt-get install -y net-tools iproute2 nmap
    SHELL
  end
end
