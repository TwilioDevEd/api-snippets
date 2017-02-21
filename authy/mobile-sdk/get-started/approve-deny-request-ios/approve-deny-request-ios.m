[sharedAuthy approveRequest:approvalRequest completion:^(BOOL success, NSError *error) {
	// ...
}];

[sharedAuthy denyRequest:approvalRequest completion:^(BOOL success, NSError *error) {
	// ...
}];