DEBUG = 0
FINALPACKAGE = 1

# Remplace par le nom de ton projet si nécessaire
TWEAK_NAME = JoyBoyModMenu

$(TWEAK_NAME)_FILES = Menu.xm
$(TWEAK_NAME)_CFLAGS = -fobjc-arc
$(TWEAK_NAME)_FRAMEWORKS = UIKit Foundation CoreGraphics

include $(THEOS)/makefiles/common.mk
include $(THEOS_MAKE_PATH)/tweak.mk
