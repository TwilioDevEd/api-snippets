// Listen for members joining a channel
myChannel.on('memberJoined', function(member) {
  console.log(member.identity + 'has joined the channel.');
});
// Listen for members joining a channel
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