// A channel has become visible to the Client
chatClient.on('channelAdded', channel => {
  console.log('Channel added: ' + channel.friendlyName);
});
// A channel is no longer visible to the Client
chatClient.on('channelRemoved', channel => {
  console.log('Channel removed: ' + channel.friendlyName);
});
// A channel's attributes or metadata have changed.
chatClient.on('channelUpdated', channel => {
  console.log('Channel updates: ' + channel.sid);
});
