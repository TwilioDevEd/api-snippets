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
            pip = new {
              z_pos = 2,
              x_pos = 1000,
              y_pos = 30,
              width = 240,
              height = 180,
              video_sources = new string[]{"teacher-webcam-video"}
            },
            column = new {
              z_pos = 3,
              x_pos = 40,
              y_pos = 10,
              width = 190,
              height = 700,
              max_rows = 5,
              max_columns = 1,
              reuse = "show_newest",
              video_sources = new string[]{"student-*"}
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
