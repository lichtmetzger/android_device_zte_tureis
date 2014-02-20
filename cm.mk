# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_mini_phone.mk)

# Inherit device configuration
$(call inherit-product, device/zte/tureis/tureis.mk)

# Correct bootanimation size for the screen
TARGET_SCREEN_HEIGHT := 320
TARGET_SCREEN_WIDTH := 240

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := tureis
PRODUCT_NAME := cm_tureis
PRODUCT_BRAND := ZTE
PRODUCT_MODEL := Tureis
PRODUCT_MANUFACTURER := ZTE
PRODUCT_RELEASE_NAME := Tureis

# Set build fingerprint / ID / Product Name ect.
#PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=tureis BUILD_ID=JRO03C BUILD_FINGERPRINT=ZTE/N880E_JB4_2/atlas40:4.2/JOP40C/20121121.110335:user/release-keys PRIVATE_BUILD_DESC="N880E_JB4_2-user 4.2 JOP40C 20121121.110335 release-keys" BUILD_NUMBER=20121121.110335