[sharedTwilioAuth approveRequest:approvalRequest completion:^(BOOL success, NSError *error) {
	// ...
}];

[sharedTwilioAuth denyRequest:approvalRequest completion:^(BOOL success, NSError *error) {
	// ...
}];