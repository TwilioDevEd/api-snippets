func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
  // Override point for customization after application launch.
  let settings = UIUserNotificationSettings(forTypes: .Alert, categories: nil)
  UIApplication.sharedApplication().registerUserNotificationSettings(settings)
  UIApplication.sharedApplication().registerForRemoteNotifications()
  return true
}