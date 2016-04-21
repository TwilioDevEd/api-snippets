using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Twilio;
using Twilio.Auth;
using JWT;

// ... somewhere inside your class ...

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

Console.WriteLine(token.ToJWT())

// ... rest of your class ...
