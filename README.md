CyanogenMod 10.1 device configuration for the ZTE Tureis.

http://www.modaco.com/topic/369154-cm101-422-schmatzlers-rom-for-the-zte-tureis/

How to build:
-------------

Initialize repo for the ZTE Blade (that was my base for building the Tureis tree:

    repo init -u git://github.com/CyanogenMod/android.git -b cm-10.1
    curl --create-dirs -L -o .repo/local_manifests/local_manifest.xml -O -L https://raw.github.com/legaCyMod/android_local_manifest/cm-10.1/local_manifest.xml
    curl -L -o .repo/local_manifests/manifest_zte_blade.xml -O -L https://raw.github.com/legaCyMod/android_local_manifest/cm-10.1/manifest_zte_blade.xml
    repo sync

Take my device tree and copy it to the device, vendor and kernel directories.

Revert the following patches in display-legacy to get along with my kernel:

https://www.codeaurora.org/cgit/external/gigabyte/platform/hardware/qcom/display/commit/?h=caf/ics&id=53578e5bddf86628ffa9814fe036de62e06584cc
https://www.codeaurora.org/cgit/external/gigabyte/platform/hardware/qcom/display/commit/?h=caf/ics_chocolate&id=40e3d4af1039d690768b83be5fcf9e3fd07fdaa7
https://www.codeaurora.org/cgit/external/gigabyte/platform/hardware/qcom/display/commit/?h=caf/ics_chocolate&id=52bf0e40e7d8dd9439d82b9c34a8ea6f697d641a
https://www.codeaurora.org/cgit/external/gigabyte/platform/hardware/qcom/display/commit/libgralloc/framebuffer.cpp?h=caf/ics_chocolate&id=40e3d4af1039d690768b83be5fcf9e3fd07fdaa7

Compile:

    . build/envsetup.sh
    brunch tureis


