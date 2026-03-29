TARGET := iphone:clang:latest:13.0
INSTALL_TARGET_PROCESSES = VideoStar

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = WelcomeTweak

WelcomeTweak_FILES = Tweak.x
WelcomeTweak_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
