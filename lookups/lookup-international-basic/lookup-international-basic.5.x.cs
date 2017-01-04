// Download the twilio-csharp library from twilio.com/docs/libraries/csharp
using System;
using Twilio;
using Twilio.Rest.Lookups.V1;
using Twilio.Types;

public class Example
{
	public static void Main(string[] args)
	{
		// Find your Account SID and Auth Token at twilio.com/console
		const string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
		const string authToken = "your_auth_token";

		TwilioClient.Init(accountSid, authToken);

		var phoneNumber = PhoneNumberResource.Fetch(new PhoneNumber("+4402077651182"));

		Console.WriteLine(phoneNumber.NationalFormat);
	}
}
