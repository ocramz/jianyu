# jianyu
Chroot-jail experiment for installing VirtualBox in Ubuntu (监狱 - Jiānyù , "prison" )


Travis CI : [![Build Status](https://travis-ci.org/ocramz/jianyu.svg?branch=simple)](https://travis-ci.org/ocramz/jianyu)


## Notes

The `simple` branch builds all within TravisCI, whereas the `master` branch builds a Docker container with VirtualBox/Vagrant inside. The additional layer of isolation in the `master` branch has ben introduced since the installation of VirtualBox is quite buggy (due to the `vboxdrv` kernel module not building properly)