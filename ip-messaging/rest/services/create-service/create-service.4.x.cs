// Download the twilio-csharp library from twilio.com/docs/csharp/install
using System;
using Twilio.IpMessaging;
using Twilio.IpMessaging.Model;

class Example {
    static void Main (string[] args) {
        // Find your Account Sid and Auth Token at twilio.com/user/account
        const string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string authToken = "your_auth_token";
        const string friendlyName = "friendlyName";

        // Create a service
        var client = new IpMessagingClient(accountSid, authToken);
        Service service = client.CreateService(friendlyName);

        Console.WriteLine(service);
    }
}
