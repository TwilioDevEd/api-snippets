// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.Twilio;
import com.twilio.rest.video.v1.Composition;
import com.twilio.rest.video.v1.Composition.Format;

import com.fasterxml.jackson.databind.ObjectMapper;

public class SequenceComposition{

  // Find your credentials at twilio.com/console
  public static final String ACCOUNT_SID = "ACXXXX";
  public static final String API_KEY_SID = "SKXXXX";
  public static final String API_KEY_SECRET = "your_api_key_secret";

  public static void main( String[] args ) throws IOException{
      // Initialize the client
      Twilio.init(API_KEY_SID, API_KEY_SECRET, ACCOUNT_SID);

      final String videoLayout =
                          "{"
                        + "   \"sequence\": {"
                        + "       \"max_rows\": 1,"
                        + "       \"max_columns\": 1,"
                        + "       \"reuse\": \"show_newest\","
                        + "       \"video_sources\":[\"teacher-video-sess-*\"]"
                        + "    }"
                        + "}";

      Composition composition = Composition.creator()
                  .setRoomSid("RMXXXX")
                  .setAudioSources("teacher-audio-sess-*")
                  .setVideoLayout(new ObjectMapper().readValue(videoLayout, HashMap.class))
                  .setStatusCallback("http://my.server.org/callbacks")
                  .setFormat(Format.MP4)
                  .create();

      System.out.println("Created composition with SID=" + composition.getSid());
  }
}
