// Listen for members joining a channel
myChannel.on('memberJoined', function(member) {
  console.log(member.identity + 'has joined the channel.');
});
// Listen for members user info changing
myChannel.on('memberInfoUpdated', function(member) {
  console.log(member.identity + 'updated their info.');
});
// Listen for members leaving a channel
myChannel.on('memberLeft', function(member) {
  console.log(member.identity + 'has left the channel.');
});
// Listen for members typing
myChannel.on('typingStarted', function(member) {
  console.log(member.identity + 'is currently typing.');
});
// Listen for members typing
myChannel.on('typingEnded', function(member) {
  console.log(member.identity + 'has stopped typing.');
});
