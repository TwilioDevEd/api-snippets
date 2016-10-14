// Download the twilio-csharp library from twilio.com/docs/csharp/install
using System;
using Twilio;

class Example {
	static void Main (string[] args) {
    	// Find your Account Sid and Auth Token at twilio.com/user/account
    	const string accountSid = "accountSid";
    	const string authToken = "authToken";

    	const string serviceSid = "serviceSid";
    	const string userSid = "userSid";

    	// Retrieve user
    	var client = new TwilioIpMessagingClient(accountSid, authToken);
    	User user = client.GetUser(serviceSid, userSid);
    	Console.WriteLine(user);
 	}
}