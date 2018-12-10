//Get Messages Services
TwilioApiClient client = new TwilioApiClient();
TwilioApiClientResponse response = client.doGet('https://messaging.twilio.com/v1/Services');
system.debug(JSON.serializePretty(response.toMap()));
