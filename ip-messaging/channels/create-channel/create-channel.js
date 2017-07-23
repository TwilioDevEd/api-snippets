// Create a Channel
chatClient
  .createChannel({
    uniqueName: 'general',
    friendlyName: 'General Chat Channel',
  })
  .then(channel => {
    console.log('Created general channel:');
    console.log(channel);
  });
