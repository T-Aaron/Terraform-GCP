 #!/bin/bash
 sudo su

 # Mount disk
 mkfs.ext4 -m 0 -E lazy_itable_init=0,lazy_journal_init=0,discard /dev/sdb
 mkdir -p /mnt/disks/mount_data
 mount -o discard,defaults /dev/sdb /mnt/disks/mount_data
 chmod a+w /mnt/disks/mount_data
 cp /etc/fstab /etc/fstab.backup
 
 # Add auto mount when startup
 echo  UUID=`sudo blkid -s UUID -o value /dev/sdb`  /mnt/disks/mount_data ext4 discard,defaults,nofail 0 2 | sudo tee -a /etc/fstab

 