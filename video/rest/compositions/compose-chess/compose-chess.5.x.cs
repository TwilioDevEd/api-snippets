// Install the C# / .NET helper library from twilio.com/docs/csharp/install

using System;
using System.Collections.Generic;
using Twilio;
using Twilio.Rest.Video.V1;


class Program
{
    static void Main(string[] args)
    {
        // Find your Account SID and Auth Token at twilio.com/console
        // and set the environment variables. See http://twil.io/secure
        string accountSid = Environment.GetEnvironmentVariable("TWILIO_ACCOUNT_SID");
        string authToken = Environment.GetEnvironmentVariable("TWILIO_AUTH_TOKEN");

        TwilioClient.Init(accountSid, authToken);

        var audioSources = new List<string> {
            "*"
        };

        var videoLayout = new Dictionary<string, Object>()
        {
            {"chess_table", new Dictionary<string, Object>()
                {
                    {"x_pos", 10},
                    {"y_pos", 0},
                    {"width", 1260},
                    {"height", 720},
                    {"max_rows", 3},
                    {"max_columns", 3},
                    {"reuse", "show_newest"},
                    {"cells_excluded", new int [] {
                        1,
                        3,
                        5,
                        7
                    }},
                    {"video_sources", new string [] {
                        "*"
                    }}
                }}
        };

        var composition = CompositionResource.Create(
            audioSources: audioSources,
            videoLayout: videoLayout,
            statusCallback: new Uri("https://www.example.com/callbacks"),
            resolution: "1280x720",
            format: CompositionResource.FormatEnum.Mp4,
            roomSid: "RMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
        );

        Console.WriteLine(composition.Sid);
    }
}

