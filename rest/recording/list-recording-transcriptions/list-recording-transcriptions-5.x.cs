// Download the twilio-csharp library from twilio.com/docs/libraries/csharp
using System;
using Twilio;
using Twilio.Rest.Api.V2010.Account.Recording;

class Example
{
  static void Main(string[] args)
  {
    // Find your Account Sid and Token at twilio.com/console
    const string accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    const string authToken = "your_auth_token";

    TwilioClient.Init(accountSid, authToken);

    var transcriptions = TranscriptionResource.Read("REXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");

    foreach (var transcription in transcriptions)
    {
      Console.WriteLine(transcription.Sid);
      Console.WriteLine(transcription.TranscriptionText);
    }
  }
}