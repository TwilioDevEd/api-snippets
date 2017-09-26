// get desired channel (for example, with getChannelBySid promise)
chatClient.getChannelBySid(channelSid).then(function(channel) {
  // get channel's messages paginator
  channel.getMessages().then(function(messagesPaginator) {
    // check the first message type
    const message = messagesPaginator.items[0];
    if (message.type === 'media') {
      console.log('Message is media message');
      // log media properties
      console.log('Media properties', message.media);
    }
  });
});
