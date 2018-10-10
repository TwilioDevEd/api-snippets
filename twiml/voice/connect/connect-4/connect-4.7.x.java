import com.twilio.twiml.voice.Connect;
import com.twilio.twiml.VoiceResponse;
import com.twilio.twiml.voice.Room;
import com.twilio.twiml.TwiMLException;


public class Example {
    public static void main(String[] args) {
        Room room = new Room.Builder("meeting").statusCallback("https://myactionurl.com/").build();
        Connect connect = new Connect.Builder().action("https://myactionurl.com/").timeout("5").room(room).build();
        VoiceResponse response = new VoiceResponse.Builder().connect(connect).build();

        try {
            System.out.println(response.toXml());
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
    }
}
