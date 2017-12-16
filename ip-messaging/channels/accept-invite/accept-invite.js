// Listen for new invitations to your Client
chatClient.on('channelInvited', function(channel) {
  console.log('Invited to channel ' + channel.friendlyName);
  // Join the channel that you were invited to
  channel.join();
});
