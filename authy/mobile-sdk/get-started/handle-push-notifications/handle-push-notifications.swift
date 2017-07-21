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
    
    twilioAuth.getApprovalRequests(withStatuses: AUTApprovalRequestStatus.pending,
                                   timeInterval: nil)
    { requests, error in
        
        if error != nil {
            // Error fetching approval requests
            return
        }
        
        guard let requests = requests else { return }
        
        //Search in the pending request for the one that was just pushed through the notification
        if let pendingRequest = requests.pending.filter({$0.uuid == approvalRequestUUID }).first {
            
            // Do something with the pendingRequest
            print(pendingRequest)
        }
    }
}
