// Download the twilio-csharp library from twilio.com/docs/csharp/install
using System;
using Twilio;
using Twilio.IpMessaging;
using Twilio.IpMessaging.Model;

class Example {
	static void Main (string[] args) {
    	// Find your Account Sid and Auth Token at twilio.com/user/account
    	const string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    	const string authToken = "your_auth_token";

    	const string serviceSid = "ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    	const string userSid = "USXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

    	// Delete a user
    	var client = new IpMessagingClient(accountSid, authToken);
    	DeleteStatus status = client.DeleteUser(serviceSid, userSid);
    	Console.WriteLine(status);
 	}
}
