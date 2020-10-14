// Install the C# / .NET helper library from twilio.com/docs/csharp/install

using System;
using System.Collections.Generic;
using Twilio;
using Twilio.Rest.Video.V1;
using static Twilio.Rest.Video.V1.CompositionHookResource;

class Program
{
    static void Main(string[] args)
    {
        // Find your API Key SID and Secret at twilio.com/console
        // To set up environmental variables, see http://twil.io/secure
        const string apiKeySid = Environment.GetEnvironmentVariable("TWILIO_API_KEY_SID");
        const string apiKeySecret = Environment.GetEnvironmentVariable("TWILIO_API_KEY_SECRET");

        TwilioClient.Init(apiKeySid, apiKeySecret);

        var layout = new
        {
            main = new
            {
                z_pos = 1,
                video_sources = new string[]{"screen"}
            },
            pip = new {
                z_pos = 2,
                x_pos = 1000,
                y_pos = 30,
                width = 240,
                height = 180,
                video_sources = new string[]{"presenter-cam"}
            }
        };

        var compositionHook = CompositionHookResource.Create(
          friendlyName: "MyHookWithComplexVideoLayout",
          audioSources: new List<string>{"listener-audio", "presenter-audio"},
          videoLayout: layout,
          statusCallback: new Uri('http://my.server.org/callbacks'),
          resolution: "1280x720",
          format: FormatEnum.Mp4
        );

        Console.WriteLine($"Created Composition Hook with SID: {compositionHook.Sid}");
    }
}
