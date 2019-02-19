// Listen for new messages sent to a channel
myChannel.on('messageAdded', function(message) {
  console.log(message.author, message.body);
});
