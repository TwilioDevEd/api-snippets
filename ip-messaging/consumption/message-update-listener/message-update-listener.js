// this code assumes you have a variable names activeChannel for the
// currently active channel in the UI
activeChannel.on('memberUpdated', function(member) {
  // note this method would use the provided information
  // to render this to the user in some way
  updateMemberMessageReadStatus(
    member.identity,
    member.lastConsumedMessageIndex,
    member.lastConsumptionTimestamp
  );
});
