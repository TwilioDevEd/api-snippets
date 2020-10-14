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
            interviewed = new
            {
                z_pos = 2,
                x_pos = 400,
                y_pos = 180,
                width = 480,
                height = 360,
                video_sources = new string[]{"interviewed-video"}
            },
            interviewers = new {
                z_pos = 1,
                x_pos = 10,
                y_pos = 0,
                width = 1260,
                height = 720,
                max_rows = 3,
                max_columns = 3,
                reuse = "show_newest",
                cells_excluded = new int[]{4},
                video_sources = new string[]{"interviewer-*"}
            }
        };

        var composition = CompositionResource.Create(
          roomSid: "RMXXXX",
          audioSources: new List<string>{"*"},
          audioSourcesExcluded: new List<string>{"advisor-audio"},
          videoLayout: layout,
          statusCallback: new Uri('http://my.server.org/callbacks'),
          resolution: "1280x720",
          format: FormatEnum.Mp4
        );

        Console.WriteLine($"Created composition with SID: {composition.Sid}");
    }
}
