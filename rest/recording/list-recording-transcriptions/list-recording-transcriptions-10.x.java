import com.twilio.Twilio;
import com.twilio.base.ResourceSet;
import com.twilio.rest.api.v2010.account.recording.Transcription;

public class Example {
    public static final String ACCOUNT_SID = System.getenv("TWILIO_ACCOUNT_SID");
    public static final String AUTH_TOKEN = System.getenv("TWILIO_AUTH_TOKEN");

    public static void main(String args[]) {

        Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

        ResourceSet<Transcription> transcriptions = Transcription
            .reader("REXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
            .read();

        for(Transcription transcription : transcriptions) {
            System.out.println(transcription.getSid());
            System.out.println(transcription.getTranscriptionText());
        }
    }
}