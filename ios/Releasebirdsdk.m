#import "Releasebirdsdk.h"

#import <React/RCTEventDispatcher.h>
#import <React/RCTLog.h>
#import <React/RCTUtils.h>

static NSString *const RCTShowDevMenuNotification = @"RCTShowDevMenuNotification";

@implementation Releasebirdsdk
{
    BOOL _hasListeners;
}

RCT_EXPORT_MODULE()

- (void)initSDK {
}

RCT_EXPORT_METHOD(initialize:(NSString *)token showButton:(BOOL)showButton)
{
    dispatch_async(dispatch_get_main_queue(), ^{
     [[Releasebird sharedInstance] initialize:token showButton:showButton];
    });
}

RCT_EXPORT_METHOD(identify:(NSString *)hash withUserProperties: (NSDictionary *)userProperties)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [[Releasebird sharedInstance] identify:[userProperties objectForKey:@"properties"]];
    });
}

RCT_EXPORT_METHOD(showWidget)
{
    dispatch_async(dispatch_get_main_queue(), ^{
         [[Releasebird sharedInstance] showWidget];
    });
}

RCT_EXPORT_METHOD(logout)
{
    dispatch_async(dispatch_get_main_queue(), ^{
         [[Releasebird sharedInstance] logout];
    });
}

- (void)dealloc
{
    @try{
    } @catch(id anException) {}
}

@end