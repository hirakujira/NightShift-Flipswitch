#import "Switch.h"

static SBCCNightShiftSetting *getNightShiftSetting(void) {
	SBControlCenterController* controlCenterController = [%c(SBControlCenterController) sharedInstanceIfExists];
    SBControlCenterViewController* controlCenterViewController = MSHookIvar<SBControlCenterViewController*>(controlCenterController, "_viewController");

	if (controlCenterViewController) {
		SBControlCenterContentView *contentView = MSHookIvar<SBControlCenterContentView*>(controlCenterViewController, "_contentView");
		if (contentView && [contentView respondsToSelector:@selector(quickLaunchSection)]) {
			id quickLaunchSection = contentView.quickLaunchSection;
			NSMutableDictionary* _modulesByID = MSHookIvar<NSMutableDictionary*>(quickLaunchSection, "_modulesByID");
			SBCCNightShiftSetting* target = _modulesByID[@"nightShift"];
			return target;
		}
	}
	return nil;
}

@implementation NightShift
- (FSSwitchState)stateForSwitchIdentifier:(NSString *)switchIdentifier {
	SBCCNightShiftSetting* toggle = getNightShiftSetting();
	int currentStatus = MSHookIvar<int>(toggle, "_currentStatus");
    return currentStatus == 65793 ? FSSwitchStateOn : FSSwitchStateOff;
}

- (void)applyState:(FSSwitchState)newState forSwitchIdentifier:(NSString *)switchIdentifier {
    SBCCNightShiftSetting* toggle = getNightShiftSetting();
    switch (newState) {
        case FSSwitchStateIndeterminate:
            return;
        default:
        	[toggle _toggleState];
        	break;
    }
}
@end
