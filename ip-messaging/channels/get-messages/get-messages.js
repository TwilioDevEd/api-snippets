// Get Messages for a previously created channel
channel.getMessages().then(function(messages) {
  let totalMessages = messages.items.length;
  for (i = 0; i < totalMessages; i++) {
    let message = messages.items[i];
    console.log('Author:' + message.author);
  }
  console.log('Total Messages:' + totalMessages);
});
