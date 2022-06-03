// Install the Java helper library from twilio.com/docs/java/install

import com.twilio.Twilio;
import com.twilio.rest.video.v1.Composition;

import java.net.URI;
import java.util.Arrays;
import java.util.HashMap;

public class Example {
    // Find your Account SID and Auth Token at twilio.com/console
    // and set the environment variables. See http://twil.io/secure
    public static final String ACCOUNT_SID = System.getenv("TWILIO_ACCOUNT_SID");
    public static final String AUTH_TOKEN = System.getenv("TWILIO_AUTH_TOKEN");

    public static void main(String[] args) {
        Twilio.init(ACCOUNT_SID, AUTH_TOKEN);
        Composition composition =
            Composition.creator("RMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
            .setAudioSources(Arrays.asList("*"))
            .setVideoLayout(
                new HashMap<String, Object>()
                {{
                    put("chess_table", new HashMap<String, Object>()
                    {{
                        put("x_pos", 10);
                        put("y_pos", 0);
                        put("width", 1260);
                        put("height", 720);
                        put("max_rows", 3);
                        put("max_columns", 3);
                        put("reuse", "show_newest");
                        put("cells_excluded", new int [] {
                            1,
                            3,
                            5,
                            7
                        });
                        put("video_sources", new String [] {
                            "*"
                        });
                    }});
                }})
            .setStatusCallback(
                URI.create("https://www.example.com/callbacks"))
            .setResolution("1280x720")
            .setFormat(Composition.Format.MP4)
            .create();

        System.out.println(composition.getSid());
    }
}
