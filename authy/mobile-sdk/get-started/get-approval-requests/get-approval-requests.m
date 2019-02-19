NSArray *statuses = @[AUTApproveStatus, AUTDenyStatus, AUTPendingStatus, AUTExpiredStatus];
AUTTimeInterval *timeInterval = [[AUTTimeInterval alloc] init];
long since = ... // lower limit
long until = ... // upper limit
timeInterval.sinceTimestamp = since;
timeInterval.untilTimestamp = until;

[sharedTwilioAuth getApprovalRequestsWithStatuses:statuses timeInterval:timeInterval completion:^(AUTApprovalRequests *approvalRequests, NSError *error) {
	// ...
}];