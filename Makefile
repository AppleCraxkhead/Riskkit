DEBUG=0
FINALPACKAGE=1
include $(THEOS)/makefiles/common.mk

export ARCHS = armv7 armv7s arm64 arm64e
TWEAK_NAME = Riskkit
Riskkit_FILES = Reddit.xm Apollo.xm

include $(THEOS_MAKE_PATH)/tweak.mk
