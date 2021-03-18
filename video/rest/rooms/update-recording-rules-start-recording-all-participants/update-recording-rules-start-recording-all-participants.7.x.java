// Install the Java helper library from twilio.com/docs/java/install
import com.fasterxml.jackson.databind.ObjectMapper;
import com.twilio.Twilio;
import com.twilio.rest.video.v1.room.RecordingRules;
import com.twilio.type.RecordingRule;
import com.twilio.type.RecordingRulesUpdate;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

public class UpdateRules{
  // Find your Account Sid and Token at twilio.com/console
  // and set the environment variables. See http://twil.io/secure
  public static final String ACCOUNT_SID = System.getenv("TWILIO_ACCOUNT_SID");
  public static final String AUTH_TOKEN = System.getenv("TWILIO_AUTH_TOKEN");

  public static void main( String[] args ) throws IOException{
      // Initialize the client
      Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

      ArrayList<RecordingRule> rules = new ArrayList<>();
      rules.add(RecordingRule.builder()
              .withType(RecordingRule.Type.INCLUDE).withAll()
              .build());
	
      RecordingRules recordingRules =
          RecordingRules.updater("RMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
          .setRules(new ObjectMapper().convertValue(new RecordingRulesUpdate(rules), Map.class))
          .update();

	  System.out.println(recordingRules.getRoomSid());
  }
}
