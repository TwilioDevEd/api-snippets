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
        const string apiKeySid = "SKXXXX";
        const string apiKeySecret = "your_api_key_secret";

        TwilioClient.Init(apiKeySid, apiKeySecret);

        var layout = new
        {
            sequence = new
            {
              max_rows = 1,
              max_columns = 1,
              reuse = "show_newest",
              video_sources = new string[]{"teacher-video-sess-*"}
            }
        };

        var composition = CompositionResource.Create(
          roomSid: "RMXXXX",
          audioSources: new List<string>{"teacher-audio-sess-*"},
          videoLayout: layout,
          statusCallback: new Uri('http://my.server.org/callbacks'),
          format: FormatEnum.Mp4
        );

        Console.WriteLine($"Created composition with SID: {composition.Sid}");
    }
}
