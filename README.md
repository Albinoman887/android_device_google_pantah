# Pantah device tree

## Table of Contents

- [Pantah device tree](#pantah-device-tree)
  - [Table of Contents](#table-of-contents)
  - [About ](#about-)
  - [Getting Started ](#getting-started-)
    - [Prerequisites  ](#prerequisites--)
    - [Troubleshooting ](#troubleshooting-)

## About <a name = "about"></a>

Clean base device tree for pantah to fork from when doing bringup for any new ROM

## Getting Started <a name = "getting_started"></a>

I've noticed everything is very fragmented around the community of builders for our device. A lot of time is wasted with people trying to solve a problem that has already been solved. This is a clean base device tree for pantah to fork from when doing bringup for any new ROM. This will help keep things organized and clean. as well as minimize the amount of time wasted on redundant work. This is nobodies fault or anything. just the rapid development cycle and different people working at different times things get lost in the ether. I removed anything that is known to be incompatible across different ROM bases. In general though its basically the LOS device tree, updated to be built with StatixOS's versions of the vendor lib repos that are generated with adevtool (gitlab.com/anay2001/android_vendor_google_devices_cheetah & gitlab.com/anay2001/android_vendor_google_devices_panther) instead of the basic LOS based ones (gitlab.com/the-muppets/proprietary_vendor_google_cheetah & gitlab.com/the-muppets/proprietary_vendor_google_panther) that are extracted with the extract-files.sh script. The consensus seems to be StatixOS are more complete

### Prerequisites  <a name = "prerequisites"></a>

This repo was created assuming the following:

- You have a working build environment
- You are going to be building the kernel inline with ROM. A good base to start with is LineageOS's android_kernel_google_gs201 synced to hardware/google/gs201/private/gs-google
- You are going to be using the vendor libs repo generated with adevtool (gitlab.com/anay2001/android_vendor_google_devices_cheetah & gitlab.com/anay2001/android_vendor_google_devices_panther)
- You are using LOS based hardware/google/pixel and hardware/google/pixel-sepolicy repos (so you can build the lineage Pixel Touch HAL for glove mode, and the Powershare HAL for battery share)
- You are using the LOS based hardware/google/gchips, and hardware/google/graphics/common repos (so you can build the lineage Pixel 7/7 Pro kernel modules)

It also depends on the following kernel module repos, Most rom's  have been updated to track these by default but if you don't have anything synced to kernel/google/gs201/private/google-modules add these to your local_manifest.xml

```
  <!-- Pixel 7/7 Pro kernel modules -->
  <project path="kernel/google/gs201/private/google-modules/amplifiers" name="kernel/google-modules/amplifiers" groups="pixel-extra" remote="aosp" revision="refs/tags/android-13.0.0_r0.75" />
  <project path="kernel/google/gs201/private/google-modules/aoc" name="kernel/google-modules/aoc" groups="pixel-extra" remote="aosp" revision="refs/tags/android-13.0.0_r0.75" />
  <project path="kernel/google/gs201/private/google-modules/aoc_ipc" name="kernel/google-modules/aoc-ipc" groups="pixel-extra" remote="aosp" revision="refs/tags/android-13.0.0_r0.75" />
  <project path="kernel/google/gs201/private/google-modules/bluetooth/broadcom" name="kernel/google-modules/bluetooth/broadcom" groups="pixel-extra" remote="aosp" revision="refs/tags/android-13.0.0_r0.75" />
  <project path="kernel/google/gs201/private/google-modules/bms" name="kernel/google-modules/bms" groups="pixel-extra" remote="aosp" revision="refs/tags/android-13.0.0_r0.75" />
  <project path="kernel/google/gs201/private/google-modules/display" name="kernel/google-modules/display" groups="pixel-extra" remote="aosp" revision="refs/tags/android-13.0.0_r0.75" />
  <project path="kernel/google/gs201/private/google-modules/edgetpu/janeiro" name="kernel/google-modules/edgetpu/janeiro" groups="pixel-extra" remote="aosp" revision="refs/tags/android-13.0.0_r0.75" />
  <project path="kernel/google/gs201/private/google-modules/gpu" name="kernel/google-modules/gpu" groups="pixel-extra" remote="aosp" revision="refs/tags/android-13.0.0_r0.75" />
  <project path="kernel/google/gs201/private/google-modules/gxp/gs201" name="kernel/google-modules/gxp/gs201" groups="pixel-extra" remote="aosp" revision="refs/tags/android-13.0.0_r0.75" />
  <project path="kernel/google/gs201/private/google-modules/lwis" name="kernel/google-modules/lwis" groups="pixel-extra" remote="aosp" revision="refs/tags/android-13.0.0_r0.75" />
  <project path="kernel/google/gs201/private/google-modules/nfc" name="kernel/google-modules/nfc" groups="pixel-extra" remote="aosp" revision="refs/tags/android-13.0.0_r0.75" />
  <project path="kernel/google/gs201/private/google-modules/power/reset" name="kernel/google-modules/power/reset" groups="pixel-extra" remote="aosp" revision="refs/tags/android-13.0.0_r0.75" />
  <project path="kernel/google/gs201/private/google-modules/touch/common" name="kernel/google-modules/touch/common" groups="pixel-extra" remote="aosp" revision="refs/tags/android-13.0.0_r0.75" />
  <project path="kernel/google/gs201/private/google-modules/touch/focaltech" name="kernel/google-modules/touch/focaltech_touch" groups="pixel-extra" remote="aosp" revision="refs/tags/android-13.0.0_r0.75" />
  <project path="kernel/google/gs201/private/google-modules/touch/sec" name="kernel/google-modules/touch/sec_touch" groups="pixel-extra" remote="aosp" revision="refs/tags/android-13.0.0_r0.75" />
  <project path="kernel/google/gs201/private/google-modules/touch/synaptics" name="kernel/google-modules/touch/synaptics_touch" groups="pixel-extra" remote="aosp" revision="refs/tags/android-13.0.0_r0.75" />
  <project path="kernel/google/gs201/private/google-modules/uwb" name="kernel/google-modules/uwb" groups="pixel-extra" remote="aosp" revision="refs/tags/android-13.0.0_r0.75" />
  <project path="kernel/google/gs201/private/google-modules/video/gchips" name="kernel/google-modules/video/gchips" groups="pixel-extra" remote="aosp" revision="refs/tags/android-13.0.0_r0.75" />
  <project path="kernel/google/gs201/private/google-modules/wlan/bcmdhd4389" name="kernel/google-modules/wlan/bcmdhd/bcm4389" groups="pixel-extra" remote="aosp" revision="refs/tags/android-13.0.0_r0.75" />
  <project path="kernel/google/gs201/private/google-modules/wlan/wlan_ptracker" name="kernel/google-modules/wlan/wlan_ptracker" groups="pixel-extra" remote="aosp" revision="refs/tags/android-13.0.0_r0.75" />
```

Inline kernel building also requires external/dwarves. Most ROM's track this by default but here is a snippet to add to your local_manifest if it is missing

```
  <project path="external/dwarves" name="platform/external/dwarves" remote="aosp" revision="3c8f7e8b2cf7ff902b71c42d00fda30f30114b07" />
```

If you encounter build errors relating to vendor_kernel_boot or external kernel modules, or that "pahole" is missing, your ROM is missing the needed changes to support building kernels with external modules. There a dozen or so commits that need to be picked to your roms vendor repo (vendor/lineage, or vendor/spark for example). I've stashed an example branch with all the required changes applied to BananaDroids vendor_banana to support compiling kernels with external modules. You can find it here: github.com/Albinoman887/android_vendor_banana/tree/ext-kernel-modules . Add the repo as another remote to your ROM's vendor repo , fetch the remote, then cherry-pick starting at commit 8b2150899c897c6fe3893dbbc9ab5885ffe57895 "config: Use LLVM binutils for 5.10 as well" and ending with the most recent commit, cdb4b9efe0ba39592c51addff5319a66edb120c6 "kernel: Support copying modules to vendor_kernel_boot" including all the ones in between. If a merge conflict arises, just take all changes from REMOTE. In all honestly you can straight just copy and paste the BoardConfigKernel.mk from the vendor_banana repo to your ROM's vendor repo and it should work fine. but you might remove features needed for other kernel types in the process so its best to try and do it the right way.

(Pro-tip: here is a oneshot (aka one-liner) command to cherry-pick the required range of commits all at once instead of the tedious task of going one-by-one.

```
git cherry-pick 8b2150899c897c6fe3893dbbc9ab5885ffe57895^..cdb4b9efe0ba39592c51addff5319a66edb120c6
```

### Troubleshooting <a name = "troubleshooting"></a>

- If you get compile errors related missing kernel headers, you probably aren't building with an LOS fork of hardware/google/chips and hardware/google/graphics/common but are instead using the AOSP versions. The only difference between the two is the LOS ones allow the headers to be exported so the build system can use them for compiling the kernel.
- If you get compile errors related to hardware/google/pixel/touch/device.mk or hardware/google/pixel/powershare related errors (can't remember the exact one off the top of my head rn) you , again, most likely are trying to build with the AOSP versions of hardware/google/pixel, and hardware/google/pixel-sepolicy repos. Switch to a LOS based fork and you should be fine. An alternative approach would be to do what StatixOS dead and keep the AOSP repos and just add the source for the LOS Powershare and Touch hals somewhere else and call the makefiles from your device tree. But there really is no reason to do that, it just adds more work for future bringups and another repo to track and organize when you can just straight swap to the LOS forks and be done with it. It won't break features for other devices or anything like that. As far as I can tell these are really the only differences between the AOSP and LOS forks of these repos. As well as the added sepolicy rules for the new HALs
- I'll update this list as I remember more common issues
