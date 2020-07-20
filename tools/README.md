# AAOS car AVD tools
This folder contains scripts to help you sharing and running car AVD images.

## Build an Car AVD image
This builds AOSP car x86_64 userdebug AVD.
```
. device/generic/car/tools/mk_car_avd.sh
```

## Pack an AVD image
If you plan to share the AVD with others or run on other host via Android Emulator directly, you can pack necessary image files to $HOME/Downloads/x86_64
```
device/generic/car/tools/test_pack_avd_img.sh
```
* You can use it as an example to create your own script for an AVD target by pack_avd_img.sh.
* pack_avd_img.sh contains brief descriptions of each file needed.

## Start an AVD

### New AVD config
To create a clean local AVD config and run with the latest Android Emulator engine from the SDK.
```
device/generic/car/tools/test_run_local_avd.sh
```

To run the existing AVD config.
```
device/generic/car/tools/run_local_avd.sh
```

### Multiple AVDs
run_local_avd.sh allows you to setup and run multiple AVDs. You can crease a script for each of them. e.g.
```
AVD_IMAGE_DIR=$HOME/avd/aosp_car_x86_64/x86_64 \
  WORKDIR=$HOME/avd/aosp_car_x86_64 \
  ABI="x86_64" \
  $SCRIPT_DIR/tools/run_local_avd.sh
```
* Deleting the WORKDIR will let the script create it from scratch next time as the 1st run.

### Change the config
The default AVD config.ini are created as the following default settings at the 1st run. You can also change them at the 1st run, e.g.
```
ANDROID_SDK_ROOT="/Users/$USER/Library/Android/sdk" \
  WORKDIR="$HOME/avd/aosp_car_x86_64" \
  AVD_IMAGE_DIR="$HOME/avd/aosp_car_x86_64/x86_64" \
  ABI="x86_64" \
  DISPLAY_DENSITY=213 \
  DISPLAY_WIDTH=1920 \
  DISPLAY_HEIGHT=1080 \
  RAM_MB=3584 \
  ./run_local_avd.sh
```

The AVD can also be changed by editing the AVD config.ini directily, e.g. at:
```
$WORKDIR/.android/avd/my_car_avd_x86_64.avd/config.ini
```

### Android Emulator startup options
You can append [Android Emulator Command-line startup options](https://developer.android.com/studio/run/emulator-commandline#common) as needed. E.g.
  * to wipe user data:  ./run_local_avd.sh -wipe-data
  * to cold boot: ./run_local_avd.sh -no-snapshot-load
