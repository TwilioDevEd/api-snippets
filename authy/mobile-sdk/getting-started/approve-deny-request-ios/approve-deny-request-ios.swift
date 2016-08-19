self.authy?.approveRequest(approvalRequest, completion: { (error: AUTError?) -> Void in
    // ...
})

self.authy?.denyRequest(approvalRequest, completion: { (error: AUTError?) -> Void in
    // ...
})