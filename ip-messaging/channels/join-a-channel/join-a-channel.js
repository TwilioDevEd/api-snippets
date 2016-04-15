// Join a previously created channel
myChannel.join().then(function(channel) {
    console.log('Joined channel ' + channel.friendlyName) 
});