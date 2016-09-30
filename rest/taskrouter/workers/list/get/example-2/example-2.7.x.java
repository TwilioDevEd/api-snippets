// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.Twilio;
import com.twilio.base.ResourceSet;
import com.twilio.rest.taskrouter.v1.workspace.Worker;
import com.twilio.rest.taskrouter.v1.workspace.WorkerReader;

public class Example {
  private static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  private static final String AUTH_TOKEN = "your_auth_token";
  private static final String WORKSPACE_SID = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

  public static void main(String[] args) {
    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

    WorkerReader workerReader = Worker.reader(WORKSPACE_SID);

    ResourceSet<Worker> workers = workerReader
        .byAvailable("1")
        .byTaskQueueSid("WQf855e98ad280d0a0a325628e24ca9627")
        .read();

    for (Worker worker : workers) {
      System.out.println(worker.getFriendlyName());
    }

    workers = workerReader
      .setTargetWorkersExpression("type == 'leads'")
      .execute();

    for (Worker worker : workers) {
      System.out.println(worker.getFriendlyName());
    }
  }
}
