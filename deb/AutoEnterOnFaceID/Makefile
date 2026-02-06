ARCHS = arm64 arm64e
TARGET = iphone:clang:15.0:14.0
PACKAGE_VERSION = 1.0.0
PACKAGE_RELEASE = 1

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = AutoEnterOnFaceID
$(TWEAK_NAME)_FILES = Tweak.xm
$(TWEAK_NAME)_CFLAGS = -fobjc-arc
$(TWEAK_NAME)_FRAMEWORKS = UIKit Foundation
$(TWEAK_NAME)_PRIVATE_FRAMEWORKS = SpringBoardUIServices

# RootHide 关键配置
include $(ROOTHIDE)/roothide.mk
include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
install.exec "killall -9 SpringBoard"