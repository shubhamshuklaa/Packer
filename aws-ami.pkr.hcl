# If you have your default VPC available then use it. 

# packer puglin for AWS 
# https://www.packer.io/plugins/builders/amazon

packer {
  required_plugins {
    amazon = {
      source  = "github.com/hashicorp/amazon"
      version = "~> 1.3.1"
    }
  }
}

  
# which ami to use as the base and where to save it

source "amazon-ebs" "ubuntu"{
  ami_name = "packer-ubuntu-aws-{{timestamp}}"
  instance_type = "t2.micro"
  region = "ap-south-1"
  source_ami = "ami-0f58b397bc5c1f2e8"
  ssh_username    = "ubuntu"
  ami_regions     = [
                      "ap-south-1"
                    ]
}

# what to install, configure and file to copy/execute
    
build {
  name = "hq-packer"
  sources = [
    "source.amazon-ebs.ubuntu"
  ]

  provisioner "file" {
  source = "provisioner.sh"
  destination = "/tmp/provisioner.sh"
}

  provisioner "shell" {
    inline = ["chmod a+x /tmp/provisioner.sh"]
  }
  
  provisioner "shell" {
    inline = [ "ls -la /tmp"]
  }
  
    provisioner "shell" {
    inline = [ "pwd"]
  }
  
  provisioner "shell" {
    inline = [ "cat /tmp/provisioner.sh"]
  }

  provisioner "shell" {
    inline = ["/bin/bash -x /tmp/provisioner.sh"]
  }
}
