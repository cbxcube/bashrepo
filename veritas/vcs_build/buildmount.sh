#!/bin/bash

echo "Provide Veritas Mount resource name"
echo "  Example : mnt_opt_oracle_oraepm"
read resname

echo "Provide Mountpoint"
echo "  Example : /opt/oracle/oraepm"
read mountpoint

echo "Provide Block Device"
echo "  Example : /dev/vx/dsk/dg_VK1_01/lvol00"
read blockdev

echo ""
echo " Building resource "
echo $resname
echo $mountpoint
echo $blockdev

hares -add  $resname  Mount ECC_DB_SG
hares -modify $resname SnapUmount 0
hares -modify $resname CkptUmount  1
hares -modify $resname OptCheck  0
hares -modify $resname CreateMntPt  0
hares -modify $resname AccessPermissionChk  0
hares -modify $resname RecursiveMnt  0
hares -modify $resname VxFSMountLock  1
hares -modify $resname CacheRestoreAccess  0
hares -modify $resname MountPoint  $mountpoint
hares -modify $resname BlockDevice  $blockdev
hares -modify $resname FSType  vxfs
hares -modify $resname FsckOpt  "%-y"
hares -modify $resname Enabled 1

echo " ================================== "
echo " Resource $resname build completed. "
