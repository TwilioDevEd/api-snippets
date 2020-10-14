// Install the C# / .NET helper library from twilio.com/docs/csharp/install

using System;
using System.Collections.Generic;
using Twilio;
using Twilio.Rest.Video.V1;
using static Twilio.Rest.Video.V1.Participant;

class Program
{
    static void Main(string[] args)
    {
        // Find your API Key SID and Secret at twilio.com/console
        // To set up environmental variables, see http://twil.io/secure
        const string apiKeySid = Environment.GetEnvironmentVariable("TWILIO_API_KEY_SID");
        const string apiKeySecret = Environment.GetEnvironmentVariable("TWILIO_API_KEY_SECRET");

        TwilioClient.Init(apiKeySid, apiKeySecret);

        //-------------------------------------------------------------------------------
        //1. At connect time Adam wants to receive all the tracks.
        //   Done by default rule. No further actions required.


        //-------------------------------------------------------------------------------
        //2. After a while, Adam notices his bandwidth consumption is too high and
        //   decides to unsubscribe from all video tracks

        var rules = new []
        {
          new Dictionary<string, object>(){
            {"type", "include"}, {"kind", "audio"}}
        };

        SubscribeRulesResource.Update(
          "RMXXXX",
          "Adam",
          rules
        );

        Console.WriteLine("Subscribe Rules updated successfully");

        //-------------------------------------------------------------------------------
        //3. Later, a video screenshare track with SID MTXXXX is published to the room
        //   and Adam subscribes to it.

        var rules = new []
        {
          new Dictionary<string, object>(){
            {"type", "include"}, {"kind", "audio"}},
          new Dictionary<string, object>(){
            {"type", "include"}, {"track" = "MTXXXX"}}
        };

        SubscribeRulesResource.Update(
          "RMXXXX",
          "Adam",
          rules
        );

        Console.WriteLine("Subscribe Rules updated successfully");


        //-------------------------------------------------------------------------------
        //4. John, another participant, is in a noisy place and his audio track is
        //   annoying. Adam decides to unsubscribe from it.

        var rules = new []
        {
          new Dictionary<string, object> (){
            {"type", "include"}, {"kind", "audio"}},
          new Dictionary<string, object> (){
            {"type", "include"}, {"track", "MTXXXX"}},
          new Dictionary<string, object>(){
            {"type", "exclude"}, {"publisher", "John"}, {"kind", "audio"}}
        };

        SubscribeRulesResource.Update(
          "RMXXXX",
          "Adam",
          rules
        );

        Console.WriteLine("Subscribe Rules updated successfully");
    }
}
