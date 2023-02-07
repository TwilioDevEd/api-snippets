using System;
using Twilio.TwiML;
using Twilio.TwiML.Voice;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        var say = new Say("Hi", voice: "Polly.Joanna");
        say.Break(strength: "x-weak", time: "100ms");
        say.Emphasis("Words to emphasize", level: "moderate");
        say.P("Words to speak");
        say.AddText("aaaaaa");
        say.Phoneme("Words to speak", alphabet: "x-sampa", ph: "pɪˈkɑːn");
        say.AddText("bbbbbbb");
        say.Prosody("Words to speak", pitch: "-10%", rate: "85%", volume: "-6dB");
        say.S("Words to speak");
        say.SayAs("Words to speak", interpretAs: "spell-out", role: "yyyymmdd");
        say.Sub("Words to be substituted", alias: "alias");
        say.W("Words to speak");
        response.Append(say);

        Console.WriteLine(response.ToString());
    }
}
