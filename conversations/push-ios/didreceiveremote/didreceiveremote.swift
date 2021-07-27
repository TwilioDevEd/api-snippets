// Do not forget to set up a delegate for UNUserNotificationCenter
func userNotificationCenter(_ center: UNUserNotificationCenter,
                 didReceive response: UNNotificationResponse,
      withCompletionHandler completionHandler: @escaping () -> Void) {
   let userInfo = response.notification.request.content.userInfo
   if let conversationsClient = conversationsClient, conversationsClient.user != nil {
       // If your reference to the Conversations client exists 
       // and is initialized, send the notification to it
       conversationsClient.handleNotification(userInfo) { (result) in
           if !result.isSuccessful() {
               // Handling of notification was not successful, retry?
           }
       }
   } else {
       // Store the notification for later handling
       receivedNotification = userInfo
   }
}
