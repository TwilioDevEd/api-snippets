// Listen for members joining a channel
myChannel.on('memberJoined', member => {
  console.log(member.identity + 'has joined the channel.');
});
// Listen for members user info changing
myChannel.on('memberInfoUpdated', member => {
  console.log(member.identity + 'updated their info.');
});
// Listen for members leaving a channel
myChannel.on('memberLeft', member => {
  console.log(member.identity + 'has left the channel.');
});
// Listen for members typing
myChannel.on('typingStarted', member => {
  console.log(member.identity + 'is currently typing.');
});
// Listen for members typing
myChannel.on('typingEnded', member => {
  console.log(member.identity + 'has stopped typing.');
});
