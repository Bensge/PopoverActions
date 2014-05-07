ARCHS=armv7 armv7s arm64

include theos/makefiles/common.mk

TARGET=clang:7.0

TWEAK_NAME = popoveractions
popoveractions_FILES = Tweak.xm
popoveractions_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "launchctl stop com.apple.SpringBoard"