TARGET := iphone:clang:latest:7.0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = uber-spoofer

uber-spoofer_FILES = Tweak.x
uber-spoofer_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
