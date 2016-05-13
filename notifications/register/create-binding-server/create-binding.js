//Create a binding using device properties
app.post('/register', function(request, response) {
  var bindingsUrl = 'http://notification.twilio.com' + '/Services/' 
    + 'TWILIO_SERVICE_SID' + '/Bindings';

  // Create a device binding for the connecting client
  post(bindingsUrl, {
    auth: {
      username: 'TWILIO_ACCOUNT_SID',
      password: 'TWILIO_AUTH_TOKEN'
    },
    form: {
      Endpoint: request.body.endpoint, 
      Identity: request.body.identity,
      BindingType: request.body.BindingType,
      Address: request.body.Address
    }
  }, function(err, httpResponse, body) {
    var message = 'Binding created!';
    if (err) {
      message = 'Failed to create binding.'
      console.log(message);
      console.log(err);
    }

    // Send a JSON response indicating success or failure
    response.send({
      success: err,
      message: message
    });
  });

});