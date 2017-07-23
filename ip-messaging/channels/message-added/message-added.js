// Listen for new messages sent to a channel
myChannel.on('messageAdded', message => {
  console.log(message.author, message.body);
});
