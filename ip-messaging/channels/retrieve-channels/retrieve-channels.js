chatClient.getSubscribedChannels().then(function(paginator) {
  for (i = 0; i < paginator.items.length; i++) {
    var channel = paginator.items[i];
    console.log('Channel: ' + channel.friendlyName);
  }
});
