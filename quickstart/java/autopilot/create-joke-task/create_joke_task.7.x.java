// Download the helper library from https://www.twilio.com/docs/java/install
import com.twilio.Twilio;
import com.twilio.rest.autopilot.v1.assistant.Task;

import java.util.HashMap;

public class Example {
    // Your Account Sid and Auth Token from twilio.com/console
    public static final String ACCOUNT_SID = System.getenv("TWILIO_ACCOUNT_SID");
    public static final String AUTH_TOKEN = System.getenv("TWILIO_AUTH_TOKEN");

    public static void main(String[] args) {
        Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

        // Create the tell-a-joke task
        // Replace 'UAXXX...' with your Assistant's unique SID https://www.twilio.com/console/autopilot/list
        Task task = Task.creator("UAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX", "tell-a-joke")
            .setFriendlyName("tell-a-joke")
            .setActions(
                // Build task actions that say something and listens for a repsonse.
                new HashMap<String, Object>()
                {{
                    put("actions", new HashMap[] {
                        new HashMap<String, String>()
                        {{
                            put("say", "I was going to look for my missing watch, but I could never find the time.");
                        }},
                    });
                }})
            .create();
            
        System.out.println(task.getSid());
    }
}
