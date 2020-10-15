// Install the Java helper library from twilio.com/docs/java/install
import java.util.Map;
import com.twilio.Twilio;
import com.twilio.rest.video.v1.room.participant.SubscribeRules;
import com.twilio.type.SubscribeRulesUpdate;
import com.twilio.type.SubscribeRule;
import com.twilio.rest.video.v1.Room.Participants;

import com.fasterxml.jackson.databind.ObjectMapper;

public class UpdateRules{

  // Find your credentials at twilio.com/console
  // To set up environment variables, see http://twil.io/secure
  public static final String ACCOUNT_SID = System.getenv("TWILIO_ACCOUNT_SID");
  public static final String API_KEY_SID = System.getenv("TWILIO_API_KEY_SID");
  public static final String API_KEY_SECRET = System.getenv("TWILIO_API_KEY_SECRET");

  public static void main( String[] args ) throws IOException{
      // Initialize the client
      Twilio.init(API_KEY_SID, API_KEY_SECRET, ACCOUNT_SID);

      //-------------------------------------------------------------------------------
      //1. At connect time Adam wants to receive all the tracks.
      //   Done by default rule. No further actions required.


      //-------------------------------------------------------------------------------
      //2. After a while, Adam notices his bandwidth consumption is too high and
      //   decides to unsubscribe from all video tracks

      SubscribeRulesUpdate rules = new SubscribeRulesUpdate(Lists.newArrayList(
              SubscribeRule.builder()
              .withType(SubscribeRule.Type.INCLUDE)
              .withKind(SubscribeRule.Kind.AUDIO)
              .build()
          ));

      SubscribeRules result = SubscribeRules
      .updater("RMXXXX", "Adam")
      .setRules(new ObjectMapper().convertValue(rules, Map.class))
      .update();

      System.out.println("Subscribe Rules updated successfully");

      //-------------------------------------------------------------------------------
      //3. Later, a video screenshare track with SID MTXXXX is published to the room
      //   and Adam subscribes to it.

      SubscribeRulesUpdate rules = new SubscribeRulesUpdate(Lists.newArrayList(

              SubscribeRule.builder()
              .withType(SubscribeRule.Type.INCLUDE)
              .withKind(SubscribeRule.Kind.AUDIO)
              .build(),

              SubscribeRule.builder()
              .withType(SubscribeRule.Type.INCLUDE)
              .withTrack("MTXXXX")
              .build()
          ));

      SubscribeRules result = SubscribeRules
      .updater("RMXXXX", "Adam")
      .setRules(new ObjectMapper().convertValue(rules, Map.class))
      .update();

      System.out.println("Subscribe Rules updated successfully");

      //-------------------------------------------------------------------------------
      //4. John, another participant, is in a noisy place and his audio track is
      //   annoying. Adam decides to unsubscribe from it.

      SubscribeRulesUpdate rules = new SubscribeRulesUpdate(Lists.newArrayList(

          SubscribeRule.builder()
          .withType(SubscribeRule.Type.INCLUDE)
          .withKind(SubscribeRule.Kind.AUDIO)
          .build(),

          SubscribeRule.builder()
          .withType(SubscribeRule.Type.INCLUDE)
          .withTrack("MTXXXX")
          .build(),

          SubscribeRule.builder()
          .withType(SubscribeRule.Type.EXCLUDE)
          .withPublisher("John")
          .withKind(SubscribeRule.Kind.AUDIO)
          .build()
      ));

      SubscribeRules result = SubscribeRules
      .updater("RMXXXX", "Adam")
      .setRules(new ObjectMapper().convertValue(rules, Map.class))
      .update();

      System.out.println("Subscribe Rules updated successfully");
  }
}
