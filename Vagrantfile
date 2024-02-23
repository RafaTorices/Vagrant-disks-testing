# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.ssh.insert_key = false
  config.ssh.username = "vagrant"
  config.ssh.password = "vagrant"
  config.vm.define "vmdisks" do |vmdisks|
    vmdisks.vm.box = "generic/ubuntu2204"
    vmdisks.vm.box_check_update = false
    vmdisks.vm.hostname = "vmdisks"
    vmdisks.vm.disk :disk, size: "20GB", primary: true
    vmdisks.vm.provider "virtualbox" do |vb|
      vb.name = "vmdisks"
      vb.memory = "2048"
      vb.cpus = "2"
      vb.default_nic_type = "virtio"
      file_to_disk = "vmdisks.vmdk"
      unless File.exist?(file_to_disk)
          vb.customize [ "createmedium", "disk", "--filename", "vmdisks.vmdk", "--format", "vmdk", "--size", 1024 * 50 ]
      end
      vb.customize [ "storageattach", "vmdisks" , "--storagectl", "SATA Controller", "--port", "2", "--device", "0", "--type", "hdd", "--medium", file_to_disk]      
    end
    vmdisks.vm.provision "shell", path: "disk.sh"
  end
end