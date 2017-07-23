let _ = require('lodash');

// Create a binding using device properties
app.post('/register', function(request, response) {
  // Authenticate with Twilio
  let client = twilio(env.TWILIO_ACCOUNT_SID, env.TWILIO_AUTH_TOKEN);

  // Get a reference to the user notification service instance
  let service = client.notify.services(env.TWILIO_NOTIFICATION_SERVICE_SID);

  let params = {
    identity: request.body.identity,
    bindingType: request.body.BindingType,
    address: request.body.Address,
  };

  if (!_.isUndefined(request.body.endpoint)) {
    params.endpoint = request.body.endpoint;
  }

  return service.bindings
    .create(params)
    .then(function(binding) {
      let message = 'Binding created!';
      console.log(binding);
      // Send a JSON response indicating success
      response.send({
        endpoint: binding.endpoint,
        message: message,
      });
    })
    .catch(function(error) {
      let message = 'Failed to create binding: ' + error;
      console.log(message);

      // Send a JSON response indicating an internal server error
      response.status(500).send({
        error: error,
        message: message,
      });
    });
});
