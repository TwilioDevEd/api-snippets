- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  // Override point for customization after application launch.
  if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) {
    [[UIApplication sharedApplication] registerUserNotificationSettings:[UIUserNotificationSettings
                                                       settingsForTypes:(UIUserNotificationTypeSound | 
                                                         UIUserNotificationTypeAlert | 
                                                         UIUserNotificationTypeBadge)
                                                             categories:nil]];
        
    [UIApplication sharedApplication] registerForRemoteNotifications];
  } else {
    [[UIApplication sharedApplication] registerForRemoteNotifications];
  }
  return YES;
}