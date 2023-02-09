import com.twilio.Twilio;
import com.twilio.base.ResourceSet;
import com.twilio.rest.taskrouter.v1.workspace.worker.WorkerChannel;

public class ListWorkerChannel {
	private static final String ACCOUNT_SID = System.getenv("TWILIO_ACCOUNT_SID");
	private static final String AUTH_TOKEN = System.getenv("TWILIO_AUTH_TOKEN");
	private static final String WORKSPACE_SID = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
	private static final String WORKER_SID = "WKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

	public static void main(String[] args) {
		Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

		ResourceSet<WorkerChannel> channels = WorkerChannel.reader(WORKSPACE_SID, WORKER_SID).read();

		for (WorkerChannel wc : channels) {
			System.out.println(wc.getTaskChannelUniqueName());
		}
	}

}
