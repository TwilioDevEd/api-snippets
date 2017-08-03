// Join a previously created channel
client.on('channelJoined', channel => {
  console.log('Joined channel ' + channel.friendlyName);
});

myChannel.join().catch(err => {
  console.error(
    "Couldn't join channel " + channel.friendlyName + ' because ' + err
  );
});
