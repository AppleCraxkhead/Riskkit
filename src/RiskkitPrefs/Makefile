include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = RiskkitPrefs

RiskkitPrefs_FILES = $(wildcard *.m)
RiskkitPrefs_INSTALL_PATH = /Library/PreferenceBundles
RiskkitPrefs_FRAMEWORKS = UIKit
RiskkitPrefs_PRIVATE_FRAMEWORKS = Preferences
RiskkitPrefs_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/RiskkitPrefs.plist$(ECHO_END)
