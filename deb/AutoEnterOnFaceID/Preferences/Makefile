ARCHS = arm64 arm64e
TARGET = iphone:clang:15.0:14.0

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = AutoEnterOnFaceIDSettings
AutoEnterOnFaceIDSettings_FILES = AutoEnterOnFaceIDSettings.m
AutoEnterOnFaceIDSettings_INSTALL_PATH = /Library/PreferenceBundles
AutoEnterOnFaceIDSettings_FRAMEWORKS = UIKit Foundation
AutoEnterOnFaceIDSettings_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences
$(ECHO_NOTHING)cp AutoEnterOnFaceIDSettings.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/AutoEnterOnFaceIDSettings.plist$(ECHO_END)