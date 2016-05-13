-(void) application:(UIApplication *) application didReceiveRemoteNotification:(nonnull NSDictionary *)userInfo {
  NSLog(@"The notification message is: %@", [userInfo valueForKeyPath:@"aps.alert"]);
}