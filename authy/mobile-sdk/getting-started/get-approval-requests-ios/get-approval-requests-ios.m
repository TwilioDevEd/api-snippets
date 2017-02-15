NSArray *statuses = @[AUTApproveStatus, AUTDenyStatus, AUTPendingStatus, AUTExpiredStatus];
AUTTimeInterval *timeInterval = [[AUTTimeInterval alloc] init];
long since = ... // lower limit
long until = ... // upper limit
[timeInterval setSinceTimestamp:since];
[timeInterval setUntilTimestamp:until];

[sharedAuthy getApprovalRequestsWithStatuses:statuses timeInterval:timeInterval completion:^(AUTApprovalRequests *approvalRequests, NSError *error) {
	// ...
}];