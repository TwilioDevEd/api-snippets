// Create a Channel
chatClient
  .createChannel({
    uniqueName: 'general',
    friendlyName: 'General Chat Channel',
  })
  .then(function(channel) {
    console.log('Created general channel:');
    console.log(channel);
  });
