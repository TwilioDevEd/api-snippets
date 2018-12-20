// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.Twilio;
import com.twilio.rest.video.v1.CompositionHook;
import com.twilio.rest.video.v1.CompositionHook.Format;

import com.fasterxml.jackson.databind.ObjectMapper;

public class ComplexLayoutHook{

  // Find your credentials at twilio.com/console
  public static final String ACCOUNT_SID = "ACXXXX";
  public static final String API_KEY_SID = "SKXXXX";
  public static final String API_KEY_SECRET = "your_api_key_secret";

  public static void main( String[] args ) throws IOException{
      // Initialize the client
      Twilio.init(API_KEY_SID, API_KEY_SECRET, ACCOUNT_SID);

      final String videoLayout =
                        "{"
                      + "   \"main\": {"
                      + "       \"z_pos\": 1,"
                      + "       \"video_sources\":[\"screen-presetation\"]"
                      + "    },"
                      + "   \"row\": {"
                      + "       \"z_pos\": 2,"
                      + "       \"x_pos\": 1000,"
                      + "       \"y_pos\": 30,"
                      + "       \"width\": 240,"
                      + "       \"height\": 180,"
                      + "       \"video_sources\": [\"MTBBBB\"]"
                      + "    }"
                      + "}";

      CompositionHook compositionHook = CompositionHook.creator()
        					.setFriendlyName("MixingAllRoomAudiosHook")
                  .setAudioSources(Arrays.asList("MTAAAA","soundtrack"))
                  .setVideoLayout(new ObjectMapper().readValue(videoLayout, HashMap.class))
                  .setStatusCallback("http://my.server.org/callbacks")
                  .setResolution("1280x720")
                  .setFormat(Format.MP4)
                  .create();

      System.out.println("Created Composition Hook with SID=" + compositionHook.getSid());
  }
}
