import com.twilio.Twilio;
import com.twilio.rest.taskrouter.v1.workspace.worker.WorkerChannel;
import com.twilio.taskrouter.Account;

public class UpdateWorkerChannel {

	private static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
	private static final String AUTH_TOKEN = "your_auth_token";
	private static final String WORKSPACE_SID = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
	private static final String WORKER_SID = "WKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
	
	public static void main(String[] args) {
		Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

		WorkerChannel wc = WorkerChannel.updater(WORKSPACE_SID, WORKER_SID, "voice").setCapacity(1).update();
		
		System.out.println(wc.getSid() + "\t" + wc.getConfiguredCapacity());
	}

}
