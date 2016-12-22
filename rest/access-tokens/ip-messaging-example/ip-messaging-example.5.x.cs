using System;
using Twilio.JWT;

class Example
{
	static void Main(string[] args)
	{
    // These values are necessary for any access token
    const string twilioAccountSid = "ACxxxxxxxxxxxx";
    const string twilioApiKey = "SKxxxxxxxxxxxx";
    const string twilioApiSecret = "xxxxxxxxxxxxxx";

    // These are specific to IP Messaging
    const string ipmServiceSid = "ISxxxxxxxxxxxx";
    const string identity = "user@example.com";
    const string deviceId = "someiosdevice";

    // Create an Access Token generator
    var token = new AccessToken(twilioAccountSid, twilioApiKey, twilioApiSecret);
    token.Identity = identity;

    // Create an IP messaging grant for this token
    var grant = new IpMessagingGrant();
    grant.EndpointId = $"HipFlowSlackDockRC:{identity}:{deviceId}";
    grant.ServiceSid = ipmServiceSid;
    token.AddGrant(grant);

    Console.WriteLine(token.ToJwt());
  }
}
