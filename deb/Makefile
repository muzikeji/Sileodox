# 基础配置
ARCHS = arm64 arm64e
TARGET = iphone:clang:15.0:14.0
PACKAGE_VERSION = 1.0.0
PACKAGE_RELEASE = 1

# Theos 基础引入
include $(THEOS)/makefiles/common.mk

# 插件名称（修改为你的插件名）
TWEAK_NAME = MyRootHideTweak

# 插件源文件（根据实际情况修改）
$(TWEAK_NAME)_FILES = Tweak.xm
$(TWEAK_NAME)_CFLAGS = -fobjc-arc
$(TWEAK_NAME)_FRAMEWORKS = UIKit Foundation

# RootHide 关键配置（必须保留）
include $(ROOTHIDE)/roothide.mk

# Theos 插件编译规则
include $(THEOS_MAKE_PATH)/tweak.mk

# 清理临时文件
after-install::
install.exec "killall -9 SpringBoard"