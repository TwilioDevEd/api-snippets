//Get Messages Services
TwilioSF.TwilioApiClient client = new TwilioSF.TwilioApiClient();
TwilioSF.TwilioApiClientResponse response = client.doGet('https://messaging.twilio.com/v1/Services');
system.debug(JSON.serializePretty(response.toMap()));
