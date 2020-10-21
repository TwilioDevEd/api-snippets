// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.Twilio;
import com.twilio.base.ResourceSet;
import com.twilio.rest.taskrouter.v1.workspace.Worker;
import com.twilio.rest.taskrouter.v1.workspace.WorkerReader;

public class Example {
  private static final String ACCOUNT_SID = System.getenv("TWILIO_ACCOUNT_SID");
  private static final String AUTH_TOKEN = System.getenv("TWILIO_AUTH_TOKEN");
  private static final String WORKSPACE_SID = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

  public static void main(String[] args) {
    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

    WorkerReader workerReader = Worker.reader(WORKSPACE_SID);

    ResourceSet<Worker> workers = workerReader
        .setAvailable("1")
        .setTaskQueueSid("WQf855e98ad280d0a0a325628e24ca9627")
        .read();

    for (Worker worker : workers) {
      System.out.println(worker.getFriendlyName());
    }

    workers = workerReader
        .setTargetWorkersExpression("type == 'leads'")
        .read();

    for (Worker worker : workers) {
      System.out.println(worker.getFriendlyName());
    }
  }
}
