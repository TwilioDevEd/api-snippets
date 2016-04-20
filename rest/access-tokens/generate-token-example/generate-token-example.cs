using System;
using Twilio;
using Twilio.Auth;

class Example
{
	static void Main(string[] args)
	{
		// Find your Account Sid and Auth Token at twilio.com/user/account
		string AccountSid = "ACdc5f132a3c49700934481addd5ce1659";
		string SigningKeySid = SID;
		string SigningKeySecret = SECRET;

		var token = new AccessToken(SigningKeySid, AccountSid, SigningKeySecret);
		token.AddGrant(new EndpointGrant(ENDPOINT_ADDRESS));
		token.EnableNTS();
		Console.WriteLine(token.ToJWT());
	}
}
