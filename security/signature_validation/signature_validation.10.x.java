// Install the Java helper library from twilio.com/docs/java/install
import java.util.HashMap;
import java.util.Map;

import com.twilio.security.RequestValidator;

public class Example {
  public static void main(String[] args) {
    // Your Auth Token from twilio.com/user/account
    public static final String AUTH_TOKEN = System.getenv("TWILIO_AUTH_TOKEN");

    // Initialize the request validator
    RequestValidator validator = new RequestValidator(AUTH_TOKEN);

    // Store Twilio's request URL (the url of your webhook) as a variable
    String url = "https://example.com/myapp";

    // Store the application/x-www-form-urlencoded parameters from Twilio's request as a variable
    // In practice, this MUST include all received parameters, not a
    // hardcoded list of parameters that you receive today. New parameters
    // may be added without notice.
    Map<String, String> params = new HashMap<>();
    params.put("CallSid", "CA1234567890ABCDE");
    params.put("Caller", "+12349013030");
    params.put("Digits", "1234");
    params.put("From", "+12349013030");
    params.put("To", "+18005551212");

    // Store the X-Twilio-Signature header attached to the request as a variable
    String twilioSignature = "Np1nax6uFoY6qpfT5l9jWwJeit0=";

    // Check if the incoming signature is valid for your application URL and the incoming parameters
    System.out.println(validator.validate(url, params, twilioSignature));
  }
}
