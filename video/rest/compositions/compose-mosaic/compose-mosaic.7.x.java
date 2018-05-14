// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.Twilio;
import com.twilio.rest.video.v1.Composition;
import com.twilio.rest.video.v1.Composition.Format;

import com.fasterxml.jackson.databind.ObjectMapper;

public class PipComposition{

  // Find your credentials at twilio.com/console
  public static final String ACCOUNT_SID = "ACXXXX";
  public static final String API_KEY_SID = "SKXXXX";
  public static final String API_KEY_SECRET = "your_api_key_secret";

  public static void main( String[] args ) throws IOException{
      // Initialize the client
      Twilio.init(API_KEY_SID, API_KEY_SECRET, ACCOUNT_SID);

      final String videoLayout =
                        "{"
                      + "   \"interviewed\": {"
                      + "       \"z_pos\": 2,"
                      + "       \"x_pos\": 400,"
                      + "       \"y_pos\": 180,"
                      + "       \"width\": 480,"
                      + "       \"height\": 360,"
                      + "       \"video_sources\": [\"interviewed-video\"]"
                      + "    },"
                      + "   \"interviewers\": {"
                      + "       \"z_pos\": 1,"
                      + "       \"x_pos\": 10,"
                      + "       \"y_pos\": 0,"
                      + "       \"width\": 1260,"
                      + "       \"height\": 720,"
                      + "       \"max_rows\": 3,"
                      + "       \"max_columns\": 3,"
                      + "       \"reuse\": \"show_newest\","
                      + "       \"cells_excluded\": [4],"
                      + "       \"video_sources\": [\"interviewer-*\"]"
                      + "    }"
                      + "}";

      Composition composition = Composition.creator()
                  .setRoomSid("RMXXXX")
                  .setAudioSources("*")
                  .setAudioSourcesExcluded("advisor-audio")
                  .setVideoLayout(new ObjectMapper().readValue(videoLayout, HashMap.class))
                  .setStatusCallback("http://my.server.org/callbacks")
                  .setResolution("1280x720")
                  .setFormat(Format.MP4)
                  .create();

      System.out.println("Created composition with SID=" + composition.getSid());
  }
}
