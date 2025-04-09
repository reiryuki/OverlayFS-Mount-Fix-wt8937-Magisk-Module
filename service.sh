MODPATH=${0%/*}

# log
exec 2>$MODPATH/debug.log
set -x

# function
mount_bind_files() {
FILES=`find $SRC -type f`
if [ -d $TAR ]\
&& [ "`realpath $TAR`" == $TAR ]; then
  for FILE in $FILES; do
    DES=`echo $FILE | sed "s|$SRC|$TAR|g"`
    if [ -f $DES ]; then
      umount $DES
      mount -o bind $FILE $DES
    fi
  done
fi
}

# mount
HARDWARE=wt8937-n-camera
DEVICE=`getprop ro.vendor.xiaomi.device`
SRC=/vendor/etc/overlayfs/$HARDWARE/camera
TAR=/odm/etc/camera
mount_bind_files
SRC=/vendor/etc/overlayfs/$DEVICE/camera
[ "$DEVICE" ] && mount_bind_files
SRC=/vendor/lib/overlayfs/$HARDWARE
TAR=/odm/lib
mount_bind_files
SRC=/vendor/lib/overlayfs/$DEVICE
[ "$DEVICE" ] && mount_bind_files
SRC=/vendor/lib64/overlayfs/$HARDWARE
TAR=/odm/lib64
mount_bind_files
SRC=/vendor/lib64/overlayfs/$DEVICE
[ "$DEVICE" ] && mount_bind_files
killall mm-qcamera-daemon








