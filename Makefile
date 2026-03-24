TARGET = iphone:clang:latest:14.0
ARCHS = arm64 arm64e
DEBUG = 0
FINALPACKAGE = 1

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = JoyBoyModMenu
JoyBoyModMenu_FILES = tweak.xm
JoyBoyModMenu_FRAMEWORKS = UIKit Foundation CoreGraphics QuartzCore

include $(THEOS_MAKE_PATH)/tweak.mk

# Ce bloc magique cherche n'importe quelle image et la renomme correctement pour le tweak
before-package::
	mkdir -p $(THEOS_STAGING_DIR)/Library/MobileSubstrate/DynamicLibraries/
	cp logo* $(THEOS_STAGING_DIR)/Library/MobileSubstrate/DynamicLibraries/logo.png

