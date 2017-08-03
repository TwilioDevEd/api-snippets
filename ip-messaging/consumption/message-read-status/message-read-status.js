// retrieve the list of members for the active channel
const members = activeChannel.getMembers();
// for each member, set up a listener for when the member is updated
members.then(function(currentMembers) {
  currentMembers.forEach(function(member) {
    // handle the read status information for this member
    // note this method would use the provided information
    // to render this to the user in some way
    updateMemberMessageReadStatus(
      member.identity,
      member.lastConsumedMessageIndex,
      member.lastConsumptionTimestamp
    );
  });
});
