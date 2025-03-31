MODPATH=${0%/*}

# log
LOGFILE=$MODPATH/debug.log
exec 2>$LOGFILE
set -x

# var
API=`getprop ro.build.version.sdk`

# mount
HARDWARE=wt8937-n-camera
DEVICE=`getprop ro.vendor.xiaomi.device`
DIR=/vendor/etc/overlayfs/$HARDWARE/camera
FILES=`find $DIR -type f`
if [ -d /odm/etc/camera ]\
&& [ "`realpath /odm/etc/camera`" == /odm/etc/camera ]; then
  for FILE in $FILES; do
    DES=`echo $FILE | sed "s|$DIR|/odm/etc/camera|g"`
    if [ -f $DES ]; then
      umount $DES
      mount -o bind $FILE $DES
    fi
  done
fi
DIR=/vendor/etc/overlayfs/$DEVICE/camera
FILES=`find $DIR -type f`
if [ -d /odm/etc/camera ]\
&& [ "`realpath /odm/etc/camera`" == /odm/etc/camera ]; then
  for FILE in $FILES; do
    DES=`echo $FILE | sed "s|$DIR|/odm/etc/camera|g"`
    if [ -f $DES ]; then
      umount $DES
      mount -o bind $FILE $DES
    fi
  done
fi
DIR=/vendor/lib/overlayfs/$HARDWARE
FILES=`find $DIR -type f`
if [ -d /odm/lib ]\
&& [ "`realpath /odm/lib`" == /odm/lib ]; then
  for FILE in $FILES; do
    DES=`echo $FILE | sed "s|$DIR|/odm/lib|g"`
    if [ -f $DES ]; then
      umount $DES
      mount -o bind $FILE $DES
    fi
  done
fi
DIR=/vendor/lib/overlayfs/$DEVICE
FILES=`find $DIR -type f`
if [ -d /odm/lib ]\
&& [ "`realpath /odm/lib`" == /odm/lib ]; then
  for FILE in $FILES; do
    DES=`echo $FILE | sed "s|$DIR|/odm/lib|g"`
    if [ -f $DES ]; then
      umount $DES
      mount -o bind $FILE $DES
    fi
  done
fi
DIR=/vendor/lib64/overlayfs/$HARDWARE
FILES=`find $DIR -type f`
if [ -d /odm/lib64 ]\
&& [ "`realpath /odm/lib64`" == /odm/lib64 ]; then
  for FILE in $FILES; do
    DES=`echo $FILE | sed "s|$DIR|/odm/lib64|g"`
    if [ -f $DES ]; then
      umount $DES
      mount -o bind $FILE $DES
    fi
  done
fi
DIR=/vendor/lib64/overlayfs/$DEVICE
FILES=`find $DIR -type f`
if [ -d /odm/lib64 ]\
&& [ "`realpath /odm/lib64`" == /odm/lib64 ]; then
  for FILE in $FILES; do
    DES=`echo $FILE | sed "s|$DIR|/odm/lib64|g"`
    if [ -f $DES ]; then
      umount $DES
      mount -o bind $FILE $DES
    fi
  done
fi
killall mm-qcamera-daemon






