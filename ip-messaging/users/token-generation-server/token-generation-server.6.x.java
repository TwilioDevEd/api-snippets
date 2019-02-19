import com.github.javafaker.Faker;
import com.google.gson.Gson;
import com.twilio.sdk.auth.AccessToken;
import com.twilio.sdk.auth.IpMessagingGrant;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.Map;

import static spark.Spark.get;
import static spark.Spark.staticFileLocation;

public class WebApp {

  public static void main(String[] args) {
    // Serve static files from src/main/resources/public
    staticFileLocation("/public");

    // Create a Faker instance to generate a random username for the connecting user
    Faker faker = new Faker();

    // Create an access token using our Twilio credentials
    get("/token", "application/json", (request, response) -> {
      // Generate a random username for the connecting client
      String identity = faker.name().firstName() + faker.name().lastName() + faker.address().zipCode();

      // Create an endpoint ID which uniquely identifies the user on their current device
      String appName = "TwilioChatDemo";
      String endpointId = appName + ":" + identity + ":" + request.params("device");

      // Fetch environment info
      Map<String, String> env = new HashMap<String, String>();
      Path path = Paths.get(".env");
      Files.lines(path).forEach(s -> {
        String[] keyVal = s.split("=");
        String key = keyVal[0];
        String val = keyVal[1];
        env.put(key, val);
      });

      // Create IP messaging grant
      IpMessagingGrant grant = new IpMessagingGrant();
      grant.setEndpointId(endpointId);
      grant.setServiceSid(env.get("TWILIO_IPM_SERVICE_SID"));

      // Create access token
      AccessToken token = new AccessToken.Builder(
        System.getenv("TWILIO_ACCOUNT_SID"),
        System.getenv("TWILIO_API_KEY"),
        System.getenv("TWILIO_API_SECRET")
      ).identity(identity).grant(grant).build();

      // create JSON response payload
      HashMap<String, String> json = new HashMap<String, String>();
      json.put("identity", identity);
      json.put("token", token.toJWT());

      // Render JSON response
      Gson gson = new Gson();
      return gson.toJson(json);
    });
  }
}