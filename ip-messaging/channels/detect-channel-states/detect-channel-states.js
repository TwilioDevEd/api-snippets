// A channel has become visible to the Client
chatClient.on('channelAdded', function(channel) {
  console.log('Channel added: ' + channel.friendlyName);
});
// A channel is no longer visible to the Client
chatClient.on('channelRemoved', function(channel) {
  console.log('Channel removed: ' + channel.friendlyName);
});
// A channel's attributes or metadata have changed.
chatClient.on('channelUpdated', function(channel) {
  console.log('Channel updates: ' + channel.sid);
});
