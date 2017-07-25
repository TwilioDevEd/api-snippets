// Delete a previously created Channel
myChannel.delete().then(channel => {
  console.log('Deleted channel: ' + channel.sid);
});
