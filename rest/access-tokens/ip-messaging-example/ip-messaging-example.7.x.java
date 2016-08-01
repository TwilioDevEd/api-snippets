import com.twilio.jwt.accesstoken.AccessToken;
import com.twilio.jwt.accesstoken.IpMessagingGrant;

public class Example {
  public static void main(String[] args) {
    String twilioAccountSid = "ACxxxxxxxxxxxx";
    String twilioApiKey = "SKxxxxxxxxxxxx";
    String twilioApiSecret = "xxxxxxxxxxxxxx";

    String ipmServiceSid = "ISxxxxxxxxxxxx";
    String deviceId = "someiosdevice";
    String identity = "user@example.com";
    String appName = "HipFlowSlackDockRC";
    String endpointId = appName + ":" + identity + ":" + deviceId;

    IpMessagingGrant grant = new IpMessagingGrant();
    grant.setEndpointId(endpointId);
    grant.setServiceSid(ipmServiceSid);

    AccessToken token = new AccessToken.Builder(twilioAccountSid, twilioApiKey, twilioApiSecret)
        .identity(identity).grant(grant).build();

    System.out.println(token.toJwt());
  }
}
