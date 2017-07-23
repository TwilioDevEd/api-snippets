// Join a previously created channel
myChannel.join().then(channel => {
  console.log('Joined channel ' + channel.friendlyName);
});
