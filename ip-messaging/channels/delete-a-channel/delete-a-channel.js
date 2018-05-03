// Delete a previously created Channel
myChannel.delete().then(function(channel) {
  console.log('Deleted channel: ' + channel.sid);
});
