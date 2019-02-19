// Install the Java helper library from twilio.com/docs/java/install
import java.util.List;

import com.google.common.collect.Lists;
import com.twilio.http.HttpMethod;
import com.twilio.jwt.taskrouter.Policy;
import com.twilio.jwt.taskrouter.TaskRouterCapability;
import com.twilio.jwt.taskrouter.UrlUtils;

public class Example {
  // Find your Account Sid and Token at twilio.com/user/account
  private static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  private static final String AUTH_TOKEN = "your_auth_token";
  private static final String WORKSPACE_SID = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  private static final String TASKQUEUE_SID = "WQXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

  public static void main(String[] args) {
    Policy allowFetchSubresources = new Policy.Builder()
        .url(UrlUtils.taskQueue(WORKSPACE_SID, TASKQUEUE_SID) + "/**")
        .build();

    Policy allowUpdates = new Policy.Builder()
        .url(UrlUtils.taskQueue(WORKSPACE_SID, TASKQUEUE_SID))
        .method(HttpMethod.POST)
        .build();

    List<Policy> policies = Lists.newArrayList(allowFetchSubresources, allowUpdates);

    TaskRouterCapability.Builder capabilityBuilder =
        new TaskRouterCapability.Builder(ACCOUNT_SID, AUTH_TOKEN, WORKSPACE_SID, TASKQUEUE_SID)
            .policies(policies);

    String token = capabilityBuilder.build().toJwt();

    System.out.println(token);

    // By default, tokens are good for one hour.
    // Override this default timeout by specifiying a new value (in seconds).
    // For example, to generate a token good for 8 hours:
    token = capabilityBuilder.ttl(28800).build().toJwt();

    System.out.println(token);
  }
}
