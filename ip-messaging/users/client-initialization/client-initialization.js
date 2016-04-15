var accessManager = new Twilio.AccessManager('the token string from server');
var messagingClient = new Twilio.IPMessaging.Client(accessManager);