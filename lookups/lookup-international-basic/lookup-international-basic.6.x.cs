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
		// To set up environmental variables, see http://twil.io/secure
		const string accountSid = Environment.GetEnvironmentVariable("TWILIO_ACCOUNT_SID");
		const string authToken = Environment.GetEnvironmentVariable("TWILIO_AUTH_TOKEN");

		TwilioClient.Init(accountSid, authToken);

		var phoneNumber = PhoneNumberResource.Fetch(new PhoneNumber("+4402077651182"));

		Console.WriteLine(phoneNumber.NationalFormat);
	}
}
