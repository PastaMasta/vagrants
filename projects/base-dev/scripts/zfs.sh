#! /bin/bash -x

function step_1 {
  yum update -y
  sync
  sync
  sync
  echo "You should reboot!"
  echo 2 > /root/zfs_step
}

function step_2 {
  yum -y install http://download.zfsonlinux.org/epel/zfs-release.el7_3.noarch.rpm epel-release
  yum -y install zfs zfs-dracut kernel-devel kernel-headers
  systemctl preset zfs-import-cache zfs-import-scan zfs-mount zfs-share zfs-zed zfs.target
  sync
  sync
  sync
  echo "You should reboot!"
  echo 3 > /root/zfs_step
}

function step_3 {
  if ! zfs list | grep data ; then
    zpool create -f -m /data data mirror vdb vdc mirror vdd vde
    zfs create data/backup
    zfs create data/docs
    zfs create data/repo
    zfs create data/repo/media
    zfs create data/repo/os
    zfs create data/users
    zfs create data/virt
  fi
  echo 1 > /root/zfs_step
}

case `cat /root/zfs_step` in
  1)  step_1 ;;
  2)  step_2 ;;
  3)  step_3 ;;
  *)  step_1 ;;
esac
