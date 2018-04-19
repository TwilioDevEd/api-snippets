import com.twilio.twiml.VoiceResponse;
import com.twilio.twiml.voice.Say;

import static spark.Spark.*;

public class VoiceApp {
    public static void main(String[] args) {

        get("/hello", (req, res) -> "Hello Web");

        post("/", (request, response) -> {
            Say say  = new Say.Builder(
                    "Hello from your pals at Twilio! Have fun.")
                    .build();
            VoiceResponse voiceResponse = new VoiceResponse.Builder()
                    .say(say)
                    .build();
            return voiceResponse.toXml();
        });
    }
}
