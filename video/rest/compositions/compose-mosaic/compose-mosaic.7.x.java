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
            .setAudioSourcesExcluded(Arrays.asList("advisor-audio"))
            .setVideoLayout(
                new HashMap<String, Object>()
                {{
                    put("interviewed", new HashMap<String, Object>()
                    {{
                        put("z_pos", 2);
                        put("x_pos", 400);
                        put("y_pos", 180);
                        put("width", 480);
                        put("height", 360);
                        put("video_sources", new String [] {
                            "interviewed-video"
                        });
                    }});
                    put("interviewers", new HashMap<String, Object>()
                    {{
                        put("z_pos", 1);
                        put("x_pos", 10);
                        put("y_pos", 0);
                        put("width", 1260);
                        put("height", 720);
                        put("max_rows", 3);
                        put("max_columns", 3);
                        put("cells_excluded", new int [] {
                            4
                        });
                        put("reuse", "show_newest");
                        put("video_sources", new String [] {
                            "interviewer-*"
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
