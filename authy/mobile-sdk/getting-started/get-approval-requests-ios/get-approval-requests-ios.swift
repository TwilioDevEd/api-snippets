let statuses = [AUTApproveStatus, AUTDenyStatus, AUTPendingStatus, AUTExpiredStatus]
let timeInterval = AUTTimeInterval()
let since = ... // lower limit
let until = ... // upper limit
timeInterval.setSinceTimestamp(since)
timeInterval.setUntilTimestamp(until)

sharedAuthy.getApprovalRequests(withStatuses: statuses, timeInterval: timeInterval) { (requests, error) in
	// ...	
}
