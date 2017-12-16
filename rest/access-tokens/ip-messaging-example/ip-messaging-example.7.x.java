import com.twilio.jwt.accesstoken.AccessToken;
import com.twilio.jwt.accesstoken.ChatGrant;

public class Example {
  public static void main(String[] args) {
    String twilioAccountSid = "ACxxxxxxxxxxxx";
    String twilioApiKey = "SKxxxxxxxxxxxx";
    String twilioApiSecret = "xxxxxxxxxxxxxx";

    String serviceSid = "ISxxxxxxxxxxxx";
    String deviceId = "someiosdevice";
    String identity = "user@example.com";
    String appName = "HipFlowSlackDockRC";
    String endpointId = appName + ":" + identity + ":" + deviceId;

    ChatGrant grant = new ChatGrant();
    grant.setEndpointId(endpointId);
    grant.setServiceSid(serviceSid);

    AccessToken token = new AccessToken.Builder(twilioAccountSid, twilioApiKey, twilioApiSecret)
        .identity(identity).grant(grant).build();

    System.out.println(token.toJwt());
  }
}
