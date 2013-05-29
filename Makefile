include theos/makefiles/common.mk

APPLICATION_NAME = Maulencer
Maulencer_FILES = main.m MaulencerApplication.mm RootViewController.mm
Maulencer_FRAMEWORKS = UIKit CoreGraphics

include $(THEOS_MAKE_PATH)/application.mk
SUBPROJECTS += maulencersi
include $(THEOS_MAKE_PATH)/aggregate.mk
