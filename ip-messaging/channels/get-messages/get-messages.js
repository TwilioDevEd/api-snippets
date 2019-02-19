// Get Messages for a previously created channel
channel.getMessages().then(function(messages) {
  const totalMessages = messages.items.length;
  for (i = 0; i < totalMessages; i++) {
    const message = messages.items[i];
    console.log('Author:' + message.author);
  }
  console.log('Total Messages:' + totalMessages);
});
