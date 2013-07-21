include theos/makefiles/common.mk

TWEAK_NAME = popoveractions
popoveractions_FILES = Tweak.xm
popoveractions_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk
