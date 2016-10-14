import static spark.Spark.get;
import static spark.Spark.staticFileLocation;

import java.util.HashMap;

import com.github.javafaker.Faker;
import com.google.gson.Gson;
import com.twilio.jwt.accesstoken.AccessToken;
import com.twilio.jwt.accesstoken.ConversationsGrant;


public class Webapp {
  public static void main(String[] args) {
    // Serve static files from src/main/resources/public
    staticFileLocation("/public");

    String ACCOUNT_SID = System.getenv("TWILIO_ACCOUNT_SID");
    String API_KEY = System.getenv("TWILIO_API_KEY");
    String API_SECRET = System.getenv("TWILIO_API_SECRET");

    String TWILIO_CONFIGURATION_SID = System.getenv("TWILIO_CONFIGURATION_SID");

    // Create a Faker instance to generate a random username for the connecting user
    Faker faker = new Faker();

    // Create an access token using our Twilio credentials
    get("/token", "application/json", (request, response) -> {
      // Generate a random username for the connecting client
      String identity =
          faker.name().firstName() + faker.name().lastName() + faker.address().zipCode();

      // Create Video grant
      VideoGrant grant =
          new VideoGrant().setConfigurationProfileSid(TWILIO_CONFIGURATION_SID);

      // Create access token
      AccessToken token = new AccessToken.Builder(ACCOUNT_SID, API_KEY, API_SECRET)
          .identity(identity)
          .grant(grant)
          .build();

      // create JSON response payload
      HashMap<String, String> json = new HashMap<String, String>();
      json.put("identity", identity);
      json.put("token", token.toJwt());

      // Render JSON response
      Gson gson = new Gson();
      return gson.toJson(json);
    });
  }
}
