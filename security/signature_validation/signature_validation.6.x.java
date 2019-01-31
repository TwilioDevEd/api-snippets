// Install the Java helper library from twilio.com/docs/java/install
import java.util.HashMap;
import java.util.Map;

import com.twilio.sdk.TwilioUtils;

public class Example {
  public static void main(String[] args) {
    // Your Auth Token from twilio.com/user/account
    String authToken = "12345";

    // Initialize the validator
    TwilioUtils validator = new TwilioUtils(authToken);

    // The Twilio request URL
    String url = "https://mycompany.com/myapp.php?foo=1&bar=2";

    // The post variables in Twilio's request
    Map<String, String> params = new HashMap<>();
    params.put("CallSid", "CA1234567890ABCDE");
    params.put("Caller", "+12349013030");
    params.put("Digits", "1234");
    params.put("From", "+12349013030");
    params.put("To", "+18005551212");

    // The X-Twilio-Signature header attached to the request
    String twilioSignature = "0/KCTR6DLpKmkAf8muzZqo1nDgQ=";

    System.out.println(validator.validateRequest(twilioSignature, url, params));
  }
}
