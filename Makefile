GO_EASY_ON_ME = 1
BUNDLE_NAME = NightShift
NightShift_FILES = Switch.xm
NightShift_FRAMEWORKS = UIKit
NightShift_LIBRARIES = flipswitch
NightShift_INSTALL_PATH = /Library/Switches
THEOS_DEVICE_IP = 127.0.0.1

ARCHS = armv7 armv7s arm64
TARGET = iphone:clang:9.2:9.3
include $(THEOS)/makefiles/common.mk
include $(THEOS)/makefiles/bundle.mk


sync: stage
	rsync -e "ssh -p 2222" -z -r .theos/_/Library/Switches/* root@127.0.0.1:/Library/Switches/
	ssh root@127.0.0.1 -p 2222 killall SpringBoard