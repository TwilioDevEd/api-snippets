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
        const string identity = "identity";
        const string roleSid = "RLXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

        // Create a user
        var client = new IpMessagingClient(accountSid, authToken);
        User user = client.CreateUser(serviceSid, identity, roleSid);
       Console.WriteLine(user);
    }
}
