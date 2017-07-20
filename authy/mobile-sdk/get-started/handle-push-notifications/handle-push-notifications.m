- (void)application:(UIApplication*)application didReceiveRemoteNotification:(NSDictionary*)userInfo {

    NSString *notificationType = [userInfo objectForKey:@"type"];
    if (![notificationType isEqualToString:@"onetouch_approval_request"]) {
        return;
    }

    NSString *approvalRequestUUID = [userInfo objectForKey:@"approval_request_uuid"];
    TwilioAuth *twilioAuth = [TwilioAuth sharedInstance];
    
    // Since the approval request has sensitive data, we'll fetch it in background with the 
    // request uuid instead of delivering the information within the userInfo.

    [twilioAuth getApprovalRequestsWithStatuses:AUTApprovalRequestStatusPending timeInterval:nil completion:^(AUTApprovalRequests * _Nullable approvalRequests, NSError * _Nullable error) {

        if (error != nil) {
            return;
        }

        //Search in the pending request for the one that was just pushed through the notification
        for (AUTApprovalRequest *pendingRequest in approvalRequests.pending) {

            if ([pendingRequest.uuid isEqualToString:approvalRequestUUID]) {


                // Do something with the pendingRequest
                return;
            }
        }
    }];

}
