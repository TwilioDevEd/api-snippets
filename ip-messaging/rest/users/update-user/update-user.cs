// Download the twilio-csharp library from twilio.com/docs/csharp/install
using System;
using Twilio;

class Example {
    static void Main (string[] args) {
        // Find your Account Sid and Auth Token at twilio.com/user/account
        string accountSid = "accountSid";
        string authToken = "authToken";

        string serviceSid = "serviceSid";
        string userSid = "userSid";
        string roleSid = "roleSid";

        // Update a user
        var client = new TwilioIpMessagingClient(accountSid, authToken);
        User user = client.UpdateUser(serviceSid, userSid, roleSid);
        Console.WriteLine(user);
    }  
}