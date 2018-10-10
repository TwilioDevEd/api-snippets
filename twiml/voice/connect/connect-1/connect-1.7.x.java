import com.twilio.twiml.voice.Connect;
import com.twilio.twiml.VoiceResponse;
import com.twilio.twiml.voice.Room;
import com.twilio.twiml.TwiMLException;


public class Example {
    public static void main(String[] args) {
        Room room = new Room.Builder("DailyStandup").build();
        Connect connect = new Connect.Builder().room(room).build();
        VoiceResponse response = new VoiceResponse.Builder().connect(connect).build();

        try {
            System.out.println(response.toXml());
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
    }
}
