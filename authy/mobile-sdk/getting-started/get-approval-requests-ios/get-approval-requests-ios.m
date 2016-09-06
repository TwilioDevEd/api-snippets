NSArray *statusOptions = @[[NSNumber numberWithInteger:AUTApprovalRequestStatusPending]];

[self.authy getApprovalRequests: statusOptions completion:^(NSArray *approvalRequests, AUTError *error) {
    // ...
}];