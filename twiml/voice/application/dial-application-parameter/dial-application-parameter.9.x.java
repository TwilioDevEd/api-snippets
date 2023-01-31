import com.twilio.twiml.voice.Application;
import com.twilio.twiml.voice.ApplicationSid;
import com.twilio.twiml.voice.Dial;
import com.twilio.twiml.voice.Parameter;
import com.twilio.twiml.VoiceResponse;
import com.twilio.twiml.TwiMLException;


public class Example {
    public static void main(String[] args) {
        ApplicationSid applicationsid = new ApplicationSid.Builder("AP1234567890abcdef1234567890abcd").build();
        Parameter parameter = new Parameter.Builder().name("TicketNumber").value("9876").build();
        Parameter parameter2 = new Parameter.Builder().name("AccountNumber").value("12345").build();
        Application application = new Application.Builder().applicationSid(applicationsid).parameter(parameter2).parameter(parameter).build();
        Dial dial = new Dial.Builder().application(application).build();
        VoiceResponse response = new VoiceResponse.Builder().dial(dial).build();

        try {
            System.out.println(response.toXml());
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
    }
}
