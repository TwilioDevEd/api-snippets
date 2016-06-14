using System;
using Twilio.Auth;

class Example
{
	static void Main(string[] args)
	{
    // These values are necessary for any access token
    var twilioAccountSid = "ACxxxxxxxxxxxx";
    var twilioApiKey = "SKxxxxxxxxxxxx";
    var twilioApiSecret = "xxxxxxxxxxxxxx";

    // These are specific to IP Messaging
    var ipmServiceSid = "ISxxxxxxxxxxxx";
    var identity = "user@example.com";
    var deviceId = "someiosdevice";

    // Create an Access Token generator
    var token = new AccessToken(twilioAccountSid, twilioApiKey, twilioApiSecret);
    token.Identity = identity;

    // Create an IP messaging grant for this token
    var grant = new IpMessagingGrant();
    grant.EndpointId = $"HipFlowSlackDockRC:{identity}:{deviceId}";
    grant.ServiceSid = ipmServiceSid;
    token.AddGrant(grant);

    Console.WriteLine(token.ToJWT());
  }
}
