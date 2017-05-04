// Download the twilio-csharp library from twilio.com/docs/csharp/install
using System;
using Twilio;

class Example {
    static void Main (string[] args) {
        // Find your Account Sid and Auth Token at twilio.com/user/account
        const string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string authToken = "your_auth_token";
        const string credentialSid = "CRXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string channelSid = "CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string identity = "identity";
        const string roleSid = "RLXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

        // Add a Member
        var client = new TwilioIpMessagingClient(accountSid, authToken);
        Member member = client.CreateMember(credentialSid, channelSid, identity, roleSid);
        Console.WriteLine(member);
    }
}
