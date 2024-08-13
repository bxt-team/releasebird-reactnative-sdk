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

RCT_EXPORT_METHOD(initialize:(NSString *)token)
{
    dispatch_async(dispatch_get_main_queue(), ^{

    });
}

- (void)initialized {

}

RCT_EXPORT_METHOD(initialize:(NSString *)token)
{
    dispatch_async(dispatch_get_main_queue(), ^{

    });
}

RCT_EXPORT_METHOD(identify:(NSString *)userId withUserProperties: (NSDictionary *)userProperties)
{
    dispatch_async(dispatch_get_main_queue(), ^{

    });
}


- (void)dealloc
{
    @try{
    } @catch(id anException) {}
}

@end