TARGET = iphone:clang:latest:14.0
ARCHS = arm64 arm64e
DEBUG = 0
FINALPACKAGE = 1

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = JoyBoyModMenu
JoyBoyModMenu_FILES = Menu.xm
JoyBoyModMenu_FRAMEWORKS = UIKit Foundation CoreGraphics QuartzCore

include $(THEOS_MAKE_PATH)/tweak.mk
