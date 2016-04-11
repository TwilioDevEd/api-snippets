// Get Messages for a previously created channel
myChannel.getMessages().then(function(messages) {
  var totalMessages = messages.length;
  for (i=0; i<messages.length; i++) {
    var message = messages[i];
    console.log('Author:' + message.author);
  }
  console.log('Total Messages:' + totalMessages);
});