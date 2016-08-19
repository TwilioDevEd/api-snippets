var statusOptions: [AUTApprovalRequestStatusOption] = []
let pendingRequests: AUTApprovalRequestStatusOption = AUTApprovalRequestStatusOption(status: .Pending)
statusOptions.append(pendingRequests)

self.authy?.getApprovalRequests(withOptions: statusOptions, completion: { (approvalRequests: [AUTApprovalRequest]?, error: AUTError?) -> Void in
    // ...
})