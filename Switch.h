#import "FSSwitchDataSource.h"
#import "FSSwitchPanel.h"
#import <notify.h>
#import <SpringBoard/SpringBoard.h>

@interface SBCCNightShiftSetting : NSObject
- (void)_setNightShiftEnabled:(BOOL)enabled;
- (void)_toggleState;
@end

@interface SBControlCenterController : NSObject
+(id)sharedInstanceIfExists;
@end

@interface SBControlCenterViewController : NSObject
@end

@interface SBControlCenterContentView : UIView
@property(retain, nonatomic) id quickLaunchSection; 
@end

@interface NightShift : NSObject <FSSwitchDataSource>
@end