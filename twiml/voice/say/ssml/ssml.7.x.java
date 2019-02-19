import com.twilio.twiml.VoiceResponse;
import com.twilio.twiml.voice.Say;
import com.twilio.twiml.TwiMLException;
import com.twilio.twiml.voice.SsmlEmphasis;
import com.twilio.twiml.voice.SsmlS;
import com.twilio.twiml.voice.SsmlProsody;
import com.twilio.twiml.voice.SsmlBreak;
import com.twilio.twiml.voice.SsmlP;
import com.twilio.twiml.voice.SsmlW;
import com.twilio.twiml.voice.SsmlSayAs;
import com.twilio.twiml.voice.SsmlSub;
import com.twilio.twiml.voice.SsmlPhoneme;

public class Example {
    public static void main(String[] args) {
        SsmlBreak ssmlBreak = new SsmlBreak.Builder().strength(SsmlBreak
            .Strength.X_WEAK).time("100ms").build();
        SsmlProsody ssmlProsody = new SsmlProsody.Builder("Words to speak")
            .pitch("-10%").rate("85%").volume("-6dB").build();
        SsmlEmphasis ssmlEmphasis = new SsmlEmphasis
            .Builder("Words to emphasize").level(SsmlEmphasis.Level.MODERATE)
            .build();
        SsmlW ssmlW = new SsmlW.Builder("Words to speak").build();
        SsmlSub ssmlSub = new SsmlSub.Builder("Words to be substituted")
            .alias("alias").build();
        SsmlS ssmlS = new SsmlS.Builder("Words to speak").build();
        SsmlPhoneme ssmlPhoneme = new SsmlPhoneme.Builder("Words to speak")
            .alphabet(SsmlPhoneme.Alphabet.X_SAMPA).ph("pɪˈkɑːn").build();
        SsmlP ssmlP = new SsmlP.Builder("Words to speak").build();
        SsmlSayAs ssmlSayAs = new SsmlSayAs.Builder("Words to speak")
            .interpretAs(SsmlSayAs.InterpretAs.SPELL_OUT).build();
        Say say = new Say.Builder("Hi").voice(Say.Voice.POLLY_JOANNA)
            .ssmlBreak(ssmlBreak).ssmlEmphasis(ssmlEmphasis).ssmlP(ssmlP)
            .addText("aaaaaa").ssmlPhoneme(ssmlPhoneme).addText("bbbbbbb")
            .ssmlProsody(ssmlProsody).ssmlS(ssmlS).ssmlSayAs(ssmlSayAs)
            .ssmlSub(ssmlSub).ssmlW(ssmlW).build();
        VoiceResponse response = new VoiceResponse.Builder().say(say).build();

        try {
            System.out.println(response.toXml());
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
    }
}
