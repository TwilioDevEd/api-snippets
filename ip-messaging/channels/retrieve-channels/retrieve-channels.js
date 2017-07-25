chatClient.getSubscribedChannels().then(paginator => {
  for (i = 0; i < paginator.items.length; i++) {
    const channel = paginator.items[i];
    console.log('Channel: ' + channel.friendlyName);
  }
});
