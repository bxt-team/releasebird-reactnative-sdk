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
    Gleap.sharedInstance.delegate = self;
    [Gleap setApplicationType: REACTNATIVE];
}

RCT_EXPORT_METHOD(initialize:(NSString *)token)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self initSDK];
        [Gleap setAutoActivationMethodsDisabled];
        [Gleap initializeWithToken: token];
        [Gleap trackEvent: @"pageView" withData: @{
            @"page": @"MainPage"
        }];
    });
}

- (void)initialized {
    if (_hasListeners) {
        [self sendEventWithName:@"initialized" body: @{}];
    }
}

RCT_EXPORT_METHOD(initialize:(NSString *)token)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self initSDK];
        [Gleap setAutoActivationMethodsDisabled];
        [Gleap initializeWithToken: token];
        [Gleap trackEvent: @"pageView" withData: @{
            @"page": @"MainPage"
        }];
    });
}

RCT_EXPORT_METHOD(identify:(NSString *)userId withUserProperties: (NSDictionary *)userProperties)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        GleapUserProperty *userProperty = [[GleapUserProperty alloc] init];
        if (userProperties != nil && [userProperties objectForKey: @"name"] != nil) {
            userProperty.name = [userProperties objectForKey: @"name"];
        }
        if (userProperties != nil && [userProperties objectForKey: @"email"] != nil) {
            userProperty.email = [userProperties objectForKey: @"email"];
        }
        if (userProperties != nil && [userProperties objectForKey: @"phone"] != nil) {
            userProperty.phone = [userProperties objectForKey: @"phone"];
        }
        if (userProperties != nil && [userProperties objectForKey: @"value"] != nil) {
            userProperty.value = [userProperties objectForKey: @"value"];
        }
        if (userProperties != nil && [userProperties objectForKey: @"sla"] != nil) {
            userProperty.sla = [userProperties objectForKey: @"sla"];
        }
        if (userProperties != nil && [userProperties objectForKey: @"plan"] != nil) {
            userProperty.plan = [userProperties objectForKey: @"plan"];
        }
        if (userProperties != nil && [userProperties objectForKey: @"companyName"] != nil) {
            userProperty.companyName = [userProperties objectForKey: @"companyName"];
        }
        if (userProperties != nil && [userProperties objectForKey: @"companyId"] != nil) {
            userProperty.companyId = [userProperties objectForKey: @"companyId"];
        }
        if (userProperties != nil && [userProperties objectForKey: @"customData"] != nil) {
            userProperty.customData = [userProperties objectForKey: @"customData"];
        }
        [Gleap identifyContact: userId andData: userProperty];
    });
}


- (void)dealloc
{
    @try{
       [[NSNotificationCenter defaultCenter] removeObserver: self];
    } @catch(id anException) {}
}

@end