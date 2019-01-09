//Get Messages Services
TwilioSF__TwilioApiClient client = new TwilioSF__TwilioApiClient();
TwilioSF__TwilioApiClientResponse response = client.doGet('https://messaging.twilio.com/v1/Services');
system.debug(JSON.serializePretty(response.toMap()));
