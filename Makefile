export THEOS_PACKAGE_SCHEME = rootless
export ARCHS = arm64
export TARGET = iphone:clang:14.5:14.5

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Brazilix

$(TWEAK_NAME)_FILES = Source/Menu.mm
$(TWEAK_NAME)_FRAMEWORKS = UIKit Foundation QuartzCore CoreGraphics AudioToolbox
$(TWEAK_NAME)_CCFLAGS = -std=c++11 -fno-rtti -fno-exceptions -DNDEBUG
$(TWEAK_NAME)_CFLAGS = -fobjc-arc -Wno-deprecated-declarations -Wno-unused-variable -Wno-unused-value
$(TWEAK_NAME)_LIBRARIES = substrate

include $(THEOS_MAKE_PATH)/tweak.mk
