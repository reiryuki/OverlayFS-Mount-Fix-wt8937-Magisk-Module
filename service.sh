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
HARD=wt8937
DEV=`getprop ro.vendor.xiaomi.device`
SRC=/vendor/etc/overlayfs/$HARD/camera
TAR=/odm/etc/camera
mount_bind_files
SRC=/vendor/etc/overlayfs/$DEV/camera
[ "$DEV" ] && mount_bind_files
SRC=/vendor/etc/overlayfs/$HARD/sensors
TAR=/vendor/etc/sensors
mount_bind_files
SRC=/vendor/etc/overlayfs/$DEV/sensors
[ "$DEV" ] && mount_bind_files
SRC=/vendor/lib/overlayfs/$HARD-n-camera
TAR=/odm/lib
mount_bind_files
SRC=/vendor/lib/overlayfs/$DEV
[ "$DEV" ] && mount_bind_files
SRC=/vendor/lib64/overlayfs/$HARD-n-camera
TAR=/odm/lib64
mount_bind_files
SRC=/vendor/lib64/overlayfs/$DEV
[ "$DEV" ] && mount_bind_files
killall sensors.qti mm-qcamera-daemon








