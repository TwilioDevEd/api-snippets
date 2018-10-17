import com.twilio.twiml.VoiceResponse;
import com.twilio.twiml.voice.Say;
import com.twilio.twiml.TwiMLException;
import com.twilio.twiml.voice.SsmlW;
import com.twilio.twiml.voice.SsmlPhoneme;
import com.twilio.twiml.voice.SsmlPhoneme.Alphabet;
import com.twilio.twiml.voice.SsmlEmphasis;
import com.twilio.twiml.voice.SsmlBreak.Strength;
import com.twilio.twiml.voice.SsmlBreak;
import com.twilio.twiml.voice.SsmlProsody;
import com.twilio.twiml.voice.SsmlSub;
import com.twilio.twiml.voice.SsmlEmphasis.Level;
import com.twilio.twiml.voice.SsmlS;
import com.twilio.twiml.voice.SsmlSayAs.Role;
import com.twilio.twiml.voice.SsmlP;
import com.twilio.twiml.voice.SsmlSayAs.InterpretAs;
import com.twilio.twiml.voice.SsmlSayAs;

public class Example {
    public static void main(String[] args) {
        SsmlBreak _break = new SsmlBreak.Builder().strength(Strength.X_WEAK).time("100ms").build();
        SsmlEmphasis emphasis = new SsmlEmphasis.Builder("Words to emphasize").level(Level.MODERATE).build();
        SsmlProsody prosody = new SsmlProsody.Builder("Words to speak").pitch("-10%").rate("85%").volume("-6dB").build();
        SsmlS s = new SsmlS.Builder("Words to speak").build();
        SsmlSub sub = new SsmlSub.Builder("Words to be substituted").alias("alias").build();
        SsmlPhoneme phoneme = new SsmlPhoneme.Builder("Words to speak").alphabet(Alphabet.X_SAMPA).ph("pɪˈkɑːn").build();
        SsmlSayAs sayAs = new SsmlSayAs.Builder("Words to speak").interpretAs(InterpretAs.SPELL_OUT).build();
        SsmlP p = new SsmlP.Builder("Words to speak").build();
        SsmlW w = new SsmlW.Builder("Words to speak").build();
        Say say = new Say.Builder("Hi").voice(Say.Voice.POLLY_JOANNA).ssmlBreak(_break).ssmlEmphasis(emphasis).ssmlP(p).addText("aaaaaa").ssmlPhoneme(phoneme).addText("bbbbbbb").ssmlProsody(prosody).ssmlS(s).ssmlSayAs(sayAs).ssmlSub(sub).ssmlW(w).build();
        VoiceResponse response = new VoiceResponse.Builder().say(say).build();

        try {
            System.out.println(response.toXml());
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
    }
}
