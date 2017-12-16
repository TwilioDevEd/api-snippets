// Download the twilio-csharp library from twilio.com/docs/csharp/install
using System;
using Twilio.IpMessaging;
using Twilio.IpMessaging.Model;

class Example {
	static void Main (string[] args) {
    	// Find your Account Sid and Auth Token at twilio.com/user/account
    	const string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    	const string authToken = "your_auth_token";

    	const string serviceSid = "ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    	const string userSid = "USXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

    	// Retrieve user
    	var client = new IpMessagingClient(accountSid, authToken);
    	User user = client.GetUser(serviceSid, userSid);
    	Console.WriteLine(user);
 	}
}
