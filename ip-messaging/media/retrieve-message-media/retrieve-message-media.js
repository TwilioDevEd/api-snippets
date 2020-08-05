// get desired channel (for example, with getChannelBySid promise)
chatClient.getChannelBySid(channelSid).then(function(channel) {
  // get channel's messages paginator
  channel.getMessages().then(function(messagesPaginator) {
    // check the first message type
    const message = messagesPaginator.items[0];
    if (message.type === 'media') {
      console.log('Message is media message');
      // log media properties
      console.log('Media attributes', message.media);
      // get media temporary URL for displaying/fetching
      message.media.getContentTemporaryUrl().then(function(url) {
        // log media temporary URL
        console.log('Media temporary URL is ' + url);
      });
    }
  });
});
