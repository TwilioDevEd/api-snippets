@interface TOTPViewController : UIViewController <AUTTOTPDelegate>
	// ...
@end

@implementation TOTPViewController

	// ...

- (void)didReceiveTOTP:(NSString *)totp withError:(NSError *)error {
	// ...
}

@end