$.getJSON('/token', function(data) {
  // Create an AccessManager to manage our Access Token
  var accessManager = new Twilio.AccessManager(data.token);

  // Create a Conversations Client and connect to Twilio's backend
  var videoClient = new Twilio.Video.Client(accessManager);
  videoClient.connect('my-room').then(function(room) {
      console.log('Connected to Twilio!');
  }, function (error) {
      console.log('Could not connect to Twilio: ' + error.message);
  });
});
