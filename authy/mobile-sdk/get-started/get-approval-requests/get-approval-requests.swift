let statuses = [AUTApproveStatus, AUTDenyStatus, AUTPendingStatus, AUTExpiredStatus]
let timeInterval = AUTTimeInterval()
let since = ... // lower limit
let until = ... // upper limit
timeInterval.sinceTimestamp = since
timeInterval.untilTimestamp = until

sharedTwilioAuth.getApprovalRequests(withStatuses: statuses, timeInterval: timeInterval) { (requests, error) in
	// ...	
}
