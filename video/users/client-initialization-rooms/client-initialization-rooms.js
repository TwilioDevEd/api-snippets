$.getJSON('/token', function(data) {

  // Create a Video Client and connect to Twilio's backend
  var videoClient = new Twilio.Video.Client(data.token);
  videoClient.connect({ to: 'my-room'}).then(function(room) {
      console.log('Connected to Twilio!');
  }, function (error) {
      console.log('Could not connect to Twilio: ' + error.message);
  });
});
