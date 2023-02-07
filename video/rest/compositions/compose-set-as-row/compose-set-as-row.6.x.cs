// Install the C# / .NET helper library from twilio.com/docs/csharp/install

using System;
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
            grid = new
            {
              max_rows = 1,
              video_sources = new string[]{
                  "RTAAAA",
                  "MTBBBB",
                  "teacher-webcast"
              }
            }
        };

        var composition = CompositionResource.Create(
          roomSid: "RMXXXX",
          videoLayout: layout,
          statusCallback: new Uri('http://my.server.org/callbacks'),
          format: FormatEnum.Mp4
        );

        Console.WriteLine($"Created composition with SID: {composition.Sid}");
    }
}
