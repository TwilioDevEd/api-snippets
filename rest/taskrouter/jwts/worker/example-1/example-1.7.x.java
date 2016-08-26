// Install the Java helper library from twilio.com/docs/java/install
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.twilio.http.HttpMethod;
import com.twilio.jwt.taskrouter.*;

public class Example {
  // Find your Account Sid and Token at twilio.com/user/account
  private static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  private static final String AUTH_TOKEN = "your_auth_token";
  private static final String WORKSPACE_SID = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  private static final String WORKER_SID = "WKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

  public static void main(String[] args) {
    List<Policy> policies = PolicyUtils.defaultWorkerPolicies(WORKSPACE_SID, WORKER_SID);

    Map<String, FilterRequirement> activityUpdateFilter = new HashMap<>();
    activityUpdateFilter.put("ActivitySid", FilterRequirement.REQUIRED);

    Policy allowActivityUpdates = new Policy.Builder()
        .url(UrlUtils.worker(WORKSPACE_SID, WORKER_SID))
        .method(HttpMethod.POST)
        .postFilter(activityUpdateFilter).build();

    Policy allowTasksUpdate = new Policy.Builder()
        .url(UrlUtils.allTasks(WORKSPACE_SID))
        .method(HttpMethod.POST)
        .build();

    Policy allowReservationUpdate = new Policy.Builder()
        .url(UrlUtils.allReservations(WORKSPACE_SID, WORKER_SID))
        .method(HttpMethod.POST)
        .build();

    policies.add(allowActivityUpdates);
    policies.add(allowTasksUpdate);
    policies.add(allowReservationUpdate);


    TaskRouterCapability.Builder capabilityBuilder =
        new TaskRouterCapability.Builder(ACCOUNT_SID, AUTH_TOKEN, WORKSPACE_SID, WORKER_SID)
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
