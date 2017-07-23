chatClient.getPublicChannelDescriptors().then(function(paginator) {
  for (i = 0; i < paginator.items.length; i++) {
    let channel = paginator.items[i];
    console.log('Channel: ' + channel.friendlyName);
  }
});
