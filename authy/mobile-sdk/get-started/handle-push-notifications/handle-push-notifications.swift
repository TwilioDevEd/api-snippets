func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
    
    guard
        let approvalRequestUUID = userInfo["approval_request_uuid"] as? String,
        let notificationType = userInfo["type"] as? String, notificationType == "onetouch_approval_request"
        else {
            return
    }
    
    let twilioAuth = TwilioAuth.sharedInstance() as! TwilioAuth
    
    // Since the approval request has sensitive data, we'll fetch it in background with the 
    // request uuid instead of delivering the information within the userInfo.
    
    twilioAuth.getRequestWithUUID(approvalRequestUUID)
    { request, error in
        
        if error != nil {
            // Error fetching approval request
            return
        }
        
        guard let request = request else { return }

        if request.uuid == approvalRequestUUID {
            
            // Do something with the pendingRequest
            print(request)

        }
    }
}
