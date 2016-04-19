UIApplication.sharedApplication().registerUserNotificationSettings(
    UIUserNotificationSettings(
        forTypes: [.Sound, .Alert, .Badge],
        categories: nil
    )
)
