using Twilio.TwiML;

class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        var say = new Say("Hi", voice: "Polly.Joanna");
        say.SsmlBreak(strength: "x-weak", time: "100ms");
        say.SsmlEmphasis("Words to emphasize", level: "moderate");
        say.SsmlP("Words to speak");
        say.AddText("aaaaaa");
        say.SsmlPhoneme("Words to speak", alphabet: "x-sampa", ph: "pɪˈkɑːn");
        say.AddText("bbbbbbb");
        say.SsmlProsody("Words to speak", pitch: "-10%", rate: "85%", volume: "-6dB");
        say.SsmlS("Words to speak");
        say.SsmlSayAs("Words to speak", interpretAs: "spell-out");
        say.SsmlSub("Words to be substituted", alias: "alias");
        say.SsmlW("Words to speak");
        response.Say(say);

        System.Console.WriteLine(response.ToString());
    }
}
