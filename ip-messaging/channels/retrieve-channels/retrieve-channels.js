// Get Messages for a previously created channel
messagingClient.getChannels().then(function(channels) {
  for (i=0; i<channels.length; i++) {
    var channel = channels[i];
    console.log('Channel: ' + channel.friendlyName);
  }
});