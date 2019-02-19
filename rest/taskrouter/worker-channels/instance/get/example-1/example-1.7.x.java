import com.twilio.Twilio;
import com.twilio.rest.taskrouter.v1.workspace.worker.WorkerChannel;

public class GetWorkerChannel {

	private static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
	private static final String AUTH_TOKEN = "your_auth_token";
	private static final String WORKSPACE_SID = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
	private static final String WORKER_SID = "WKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

	public static void main(String[] args) {
		Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

		WorkerChannel wc = WorkerChannel.fetcher(WORKSPACE_SID, WORKER_SID, "voice").fetch();

		System.out.println(wc.getTaskChannelUniqueName());
	}

}
