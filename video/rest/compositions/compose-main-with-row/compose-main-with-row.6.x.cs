// Install the C# / .NET helper library from twilio.com/docs/csharp/install

using System;
using System.Collections.Generic;
using Twilio;
using Twilio.Rest.Video.V1;
using static Twilio.Rest.Video.V1.CompositionResource;

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
              video_sources = new string[]{"teacher-screen-video"}
            },
            row = new {
              z_pos = 2,
              x_pos = 10,
              y_pos = 530,
              width = 1260,
              height = 160,
              max_rows = 1,
              video_sources = new string[]{"*"},
              video_sources_excluded = new string[]{"teacher-screen-video"}
            }
        };

        var composition = CompositionResource.Create(
          roomSid: "RMXXXX",
          audioSources: new List<string>{"*"},
          videoLayout: layout,
          statusCallback: new Uri('http://my.server.org/callbacks'),
          resolution: "1280x720",
          format: FormatEnum.Mp4
        );

        Console.WriteLine($"Created composition with SID: {composition.Sid}");
    }
}
