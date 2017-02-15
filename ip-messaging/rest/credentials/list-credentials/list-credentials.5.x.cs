// Download the twilio-csharp library from twilio.com/docs/libraries/csharp
using System;
using Twilio;
using Twilio.Rest.Chat.V1;

class Example
{
	static void Main(string[] args)
	{
		// Find your Account SID and Auth Token at twilio.com/console
		const string accountSid = "accountSid";
		const string authToken = "authToken";

		TwilioClient.Init(accountSid, authToken);

		// List all credentials
		var credentials = CredentialResource.Read();
		foreach (var credential in credentials)
		{
			Console.WriteLine(credential.FriendlyName);
		}
	}
}
