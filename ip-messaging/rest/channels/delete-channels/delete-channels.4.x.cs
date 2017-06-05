// Download the twilio-csharp library from twilio.com/docs/csharp/install
using System;
using Twilio.IpMessaging;
using Twilio;

class Example
{
 static void Main (string[] args)
 {
    // Find your Account Sid and Auth Token at twilio.com/user/account
    const string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    const string authToken = "your_auth_token";
    const string serviceSid = "ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    const string channelSid = "CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

    // Delete a Channel
    var client = new IpMessagingClient(accountSid, authToken);
    DeleteStatus status = client.DeleteChannel(serviceSid, channelSid);

    Console.WriteLine(status);
 }
}
