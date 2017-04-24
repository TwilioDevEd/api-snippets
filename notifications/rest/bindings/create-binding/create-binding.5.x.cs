// Download the twilio-csharp library from twilio.com/docs/libraries/csharp
using System;
using System.Collections.Generic;
using Twilio;
using Twilio.Rest.Notify.Service;

public class Example
{
    public static void Main(string[] args)
    {
        // Find your Account SID and Auth Token at twilio.com/console
        const string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        const string authToken = "your_auth_token";
        const string serviceSid = "ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

        TwilioClient.Init(accountSid, authToken);

        var binding = BindingResource.Create(
            serviceSid,
            "eyJjdHkiOiJ0d2lsaW8tZnBhO3Y9MSIsInR5cCI6IkpXVCIsImFsZyI6IkhTMjU2In0.eyJncmFudHMiOnsiY2hhdCI6eyJzZXJ2aWNlX3NpZCI6IklTNmIwZmE2MDgzOWM1MTFlNWExNTFmZWZmODE5Y2RjOWYiLCJlbmRwb2ludF9pZCI6InR3aTEtMTdjNTkyM2Y5NTBiNGJhYjllZjAwZTJlZjdkYTBkYTIifSwiaWRlbnRpdHkiOiJOb3RpZmljYXRpb25MaWJyYXJ5VW5pdFRlc3RlcjEifSwic3ViIjoiQUM3OGU4ZTY3ZmMwMjQ2NTIxNDkwZmI5OTA3ZmQwYzE2NSIsImlzcyI6IlNLMmQxYWRmOGIxYzY0YTYzM2U1ZjE4NjU5ZjdjZDE5MTEiLCJleHAiOjE0NzgyNTI4NTl9.1i256CwtacP859Xh-6cEZVio4oohxL-od9krzsa4DnY",
            "00000001",
            BindingResource.BindingTypeEnum.Apn,
            "483161f7afe6f012aa5f172d3ca93f5c245e3daf34d3a911a41f41f6af3639f6",
            new List<string> { "preferred device", "new user" });

        Console.WriteLine(binding.Sid);
    }
}
