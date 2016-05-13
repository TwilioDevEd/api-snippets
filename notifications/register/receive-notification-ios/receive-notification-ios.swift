func application(application: UIApplication, didReceiveRemoteNotification userInfo: [NSObject : AnyObject]) {
  let message = userInfo["aps"]?["alert"] as? String
  println(message)
}