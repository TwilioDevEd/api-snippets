package com.twilio;

import com.twilio.jwt.accesstoken.AccessToken;
import com.twilio.jwt.accesstoken.VideoGrant;

import java.io.File;
import java.io.FileInputStream;
import java.util.Properties;

import static spark.Spark.afterAfter;
import static spark.Spark.get;

public class Webapp {

  public static void main(String[] args) throws Exception {
    // Load the .env file into environment
    dotenv();

    // Log all requests and responses
    afterAfter(new LoggingFilter());

    // Create an access token using our Twilio credentials
    get("/", (request, response) -> {
      // Generate a random username for the connecting client
      final String identity = request.queryParams("identity") != null ? request.queryParams("identity") : "identity";

      System.out.println(identity);

      // Create Video grant
      final VideoGrant grant = new VideoGrant();
      grant.setRoom(request.queryParams("room"));

      // Create access token
      final AccessToken token = new AccessToken.Builder(
        System.getProperty("TWILIO_ACCOUNT_SID"),
        System.getProperty("TWILIO_API_KEY"),
        System.getProperty("TWILIO_API_SECRET")
      ).identity(identity).grant(grant).build();

      return token.toJwt();
    });
  }

  private static void dotenv() throws Exception {
    final File env = new File(".env");
    if (!env.exists()) {
      return;
    }

    final Properties props = new Properties();
    props.load(new FileInputStream(env));
    props.putAll(System.getenv());
    props.entrySet().forEach(p -> System.setProperty(p.getKey().toString(), p.getValue().toString()));
  }
}
