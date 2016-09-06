#import "AuthySDKManager.h"
#import <AuthySDKiOS/AuthySDKiOS.h>

@interface AuthySDKManager

@property (strong, nonatomic) Authy *authy;

@end

@implementation AuthySDKManager

-(id)init {

    self = [super init];
    self.authy = [Authy sharedAuthy];

    AUTError *error = nil;
    [self.authy setup:&error];

    if (error != nil) {
        NSLog(@"Error %@", [error message]);
    }
    
    return self;

}

@end