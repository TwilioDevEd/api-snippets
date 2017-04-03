//Create a binding using device properties
app.post('/register', function(request, response) {

  // Authenticate with Twilio
  var client = new twilio(env.TWILIO_ACCOUNT_SID,  env.TWILIO_AUTH_TOKEN);

  // Get a reference to the user notification service instance
  var service = client.notifications.services(env.TWILIO_NOTIFICATION_SERVICE_SID);

  return service.bindings.create({
    "endpoint": request.body.endpoint,
    "identity": request.body.identity,
    "bindingType": request.body.BindingType,
    "address": request.body.Address
  }).then(function(binding) {
    var message = 'Binding created!';
    console.log(binding);
    // Send a JSON response indicating success
    response.send({
      message: message
    });
  }).catch(function(error) {
    var message = 'Failed to create binding: ' + error;
    console.log(message);

    // Send a JSON response indicating an internal server error
    response.status(500).send({
      error: error,
      message: message
    });
  });
});
