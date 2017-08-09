long since = ...; // lower limit
long until= ...; // upper limit
TimeInterval timeInterval = new TimeInterval.Builder()
                                         .setSince(since)
                                         .setUntil(until)
                                         .build();
List<ApprovalRequestStatus> statuses = Arrays.asList(
                                              ApprovalRequestStatus.approved, 
                                              ApprovalRequestStatus.denied, 
                                              ApprovalRequestStatus.expired, 
                                              ApprovalRequestStatus.pending);

twilioAuth.getApprovalRequests(statuses, timeInterval);