FROM ubuntu:14.04

MAINTAINER Marco Zocca, zocca.marco gmail

# # NB: at this point, we're running as 'root'


RUN apt-get update

# # TLS-related
RUN apt-get install -y --no-install-recommends ca-certificates debian-keyring debian-archive-keyring
RUN apt-key update

RUN apt-get install -y wget

# # VirtualBox installation, "schroot" strategy
RUN apt-get install -y debootstrap schroot

# # directory and config file for the chroot
RUN sudo mkdir -p /var/chroot
ADD etc/schroot/schroot.conf /etc/schroot/schroot.conf

# # # create chroot
RUN debootstrap --foreign --variant=buildd --arch amd64 trusty /var/chroot/
#   # #enter chroot
RUN sudo schroot -v -c trusty_x86_64 -u root -b
#   # # install headers
# RUN sudo apt-get install -y linux-headers-3.19.0-28 linux-headers-3.19.0-30-generic # $(uname -r)

#   # # add VirtualBox repo, GPG keys, install and check
# RUN echo deb "http://download.virtualbox.org/virtualbox/debian trusty contrib" | sudo tee -a /etc/apt/sources.list
# RUN wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
# RUN apt-get update
# RUN apt-get install -y virtualbox-4.3 # virtualbox-5.0
# RUN VBoxManage --version 

#   # # where are the installed modules?
# RUN lsmod
# RUN find /lib/modules/`uname -r` -name '*.ko' 
#   # - modprobe -l * ## not present anymore, use 'find' as above
# RUN modinfo vboxdrv

# # RUN ls -lsA /lib/modules/
# #   - pwd

#   # # let's try some random Vagrant box
# RUN apt-get install -y vagrant
# RUN vagrant box add base http://files.vagrantup.com/precise32.box
# RUN vagrant init
# RUN vagrant up

#   # # version sanity check
# RUN vagrant vbguest --status
