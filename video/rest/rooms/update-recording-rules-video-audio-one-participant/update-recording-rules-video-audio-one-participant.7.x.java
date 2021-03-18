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

  // Find your credentials at twilio.com/console
  public static final String ACCOUNT_SID = "ACXXXX";
  public static final String API_KEY_SID = "SKXXXX";
  public static final String API_KEY_SECRET = "your_api_key_secret";

  public static void main( String[] args ) throws IOException{
      // Initialize the client
      Twilio.init(API_KEY_SID, API_KEY_SECRET, ACCOUNT_SID);
      
      ArrayList<RecordingRule> rules = new ArrayList<>();
	  rules.add(RecordingRule.builder()
			.withType(RecordingRule.Type.INCLUDE).withKind(Rule.Kind.AUDIO)
			.build());
	  
      rules.add(RecordingRule.builder()
			.withType(RecordingRule.Type.INCLUDE).withPublisher("Alice")
			.build());
	
      RecordingRules recordingRules =
			RecordingRules.updater("RMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
					.setRules(new ObjectMapper().convertValue(new RecordingRulesUpdate(rules), Map.class))
					.update();

	  System.out.println(recordingRules.getRoomSid());
  }
}
