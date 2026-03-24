TARGET = iphone:clang:latest:14.0
ARCHS = arm64 arm64e
DEBUG = 0
FINALPACKAGE = 1

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = JoyBoyModMenu
JoyBoyModMenu_FILES = tweak.xm
JoyBoyModMenu_FRAMEWORKS = UIKit Foundation CoreGraphics QuartzCore
JoyBoyModMenu_INSTALL_PATH = /Library/MobileSubstrate/DynamicLibraries/

include $(THEOS_MAKE_PATH)/tweak.mk
