#include <Foundation/Foundation.h>
#include <UIKit/UIKit.h>

#   define NSLog(fmt, ... ) NSLog((@"[Spoofer] " fmt), ##__VA_ARGS__);

NSUUID *uuid = nil;


%hook UIDevice
  -(NSUUID*)identifierForVendor {
    return uuid;
  }
%end

@interface UBDeviceUtilities : NSObject
  -(id)deviceIds;
@end

%hook UBDeviceUtilities
  - (id)deviceIds {
    id res = %orig;

		if (res != nil)  {
			res[@"uberId"] = [uuid UUIDString];
		}

    return res;
  }
%end

%ctor {
	uuid = [NSUUID UUID];
}