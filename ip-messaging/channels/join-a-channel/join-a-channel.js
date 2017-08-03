// Join a previously created channel
client.on('channelJoined', function(channel) {
  console.log('Joined channel ' + channel.friendlyName);
});

myChannel.join().catch(function(err) {
  console.error(
    "Couldn't join channel " + channel.friendlyName + ' because ' + err
  );
});
