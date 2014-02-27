CyanogenMod 10.2 device configuration for the ZTE Tureis.

http://www.modaco.com/topic/369154-cm102-431-schmatzlers-rom-for-the-zte-tureis/

How to build:
-------------

Initialize repo:

    repo init -u git://github.com/CyanogenMod/android.git -b cm-10.2
    curl --create-dirs -L -o .repo/local_manifests/local_manifest.xml -O -L https://raw.github.com/legaCyMod/android_local_manifest/cm-10.2/local_manifest.xml
    repo sync

Initialize Tureis Codebase:

    curl -L -o .repo/local_manifests/local_manifest_armv6.xml -O -L https://raw.github.com/legaCyMod/android_local_manifest/cm-10.2/local_manifest_armv6.xml
    curl -L -o .repo/local_manifests/manifest_zte_tureis.xml -O -L https://raw.github.com/schmatzler/android_device_zte_tureis/master/manifest_zte_tureis.xml
    repo sync

Revert the following patches in /hardware/qcom/display-legacy to get along with my kernel:

https://www.codeaurora.org/cgit/external/gigabyte/platform/hardware/qcom/display/commit/?h=caf/ics&id=53578e5bddf86628ffa9814fe036de62e06584cc

https://www.codeaurora.org/cgit/external/gigabyte/platform/hardware/qcom/display/commit/?h=caf/ics_chocolate&id=40e3d4af1039d690768b83be5fcf9e3fd07fdaa7

https://www.codeaurora.org/cgit/external/gigabyte/platform/hardware/qcom/display/commit/?h=caf/ics_chocolate&id=52bf0e40e7d8dd9439d82b9c34a8ea6f697d641a

Compile:

    . build/envsetup.sh
    brunch tureis

Note:

To get Bluetooth running, remove the activation check in btif_core.c where it talks about "not disabled".

For stripping down the build I removed these applications:

vendor/cm/config:

    Trebuchet, LockClock, MagicSmokeWallpapers, NoiseField, PhaseBeam, VisualizationWallpapers, PhotoTable, Galaxy4, HoloSpiralWallpaper
    LiveWallpapers, Development, vendor/cm/overlay/dictionaries, WhisperPush, LiveWallpapersPicker, DSPManager, libcyanogen-dsp, audio_effects.conf
    VoicePlus, VoiceDialer, CMAccount, Apollo, CMFileManager, SoundRecorder, Basic, CMUpdater, CMFota, e2fsck, mke2fs, tune2fs, mount.exfat
    fsck.exfat, mkfs.exfat, ntfsfix, ntfs-3g

    
    #Extra Ringtones
    include frameworks/base/data/sounds/AudioPackageNewWave.mk


/build/target/product:

core.mk

    PicoTts \
    BasicDreams \
    Browser \
    Home \
    libnfc_ndef \

generic_no_telephony.mk

    DeskClock \
    Exchange2 \
    QuickSearchBox \
    Gallery2 \
    Music \
    Email2 \

full_base_telephony.mk

    VoiceDialer

Have fun with this sucker :)