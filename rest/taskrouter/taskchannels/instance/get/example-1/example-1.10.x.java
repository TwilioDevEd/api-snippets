// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.Twilio;
import com.twilio.rest.taskrouter.v1.workspace.TaskChannel;

public class GetTaskChannel {
	// Get your Account SID and Auth Token from https://twilio.com/console
	private static final String ACCOUNT_SID = System.getenv("TWILIO_ACCOUNT_SID");
	private static final String AUTH_TOKEN = System.getenv("TWILIO_AUTH_TOKEN");
	private static final String WORKSPACE_SID = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
	private static final String TASK_CHANNEL_SID = "TCXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

	public static void main(String[] args) {
		Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

		TaskChannel taskChannel = TaskChannel.updater(WORKSPACE_SID, TASK_CHANNEL_SID).fetch();

		System.out.println(taskChannel.getUniqueName());
	}

}
