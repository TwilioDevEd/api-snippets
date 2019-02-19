sharedTwilioAuth.approveRequest(approvalRequest, completion: { (error: AUTError?) -> Void in
    // ...
})

sharedTwilioAuth.denyRequest(approvalRequest, completion: { (error: AUTError?) -> Void in
    // ...
})