- (void)application:(UIApplication*)application didReceiveRemoteNotification:(NSDictionary*)userInfo {

    NSString *notificationType = [userInfo objectForKey:@"type"];
    if (![notificationType isEqualToString:@"onetouch_approval_request"]) {
        return;
    }

    NSString *approvalRequestUUID = [userInfo objectForKey:@"approval_request_uuid"];
    TwilioAuth *twilioAuth = [TwilioAuth sharedInstance];
    
    // Since the approval request has sensitive data, we'll fetch it in background with the 
    // request uuid instead of delivering the information within the userInfo.

    [twilioAuth getRequestWithUUID:approvalRequestUUID completion:^(AUTApprovalRequest *request, NSError *error) {

        if (error != nil) {
            return;
        }

        if ([request.uuid isEqualToString:approvalRequestUUID]) {

            // Do something with the pendingRequest
            return;
        }

    }];

}
