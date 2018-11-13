// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.Twilio;
import com.twilio.rest.taskrouter.v1.workspace.TaskChannel;

public class UpdateTaskChannel {
	// Find your Account Sid and Token at twilio.com/user/account
	private static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
	private static final String AUTH_TOKEN = "your_auth_token";
	private static final String WORKSPACE_SID = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
	private static final String TASK_CHANNEL_SID = "TCXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

	public static void main(String[] args) {
		Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

		TaskChannel.updater(WORKSPACE_SID, TASK_CHANNEL_SID)
			.setFriendlyName("My New Channel")
			.update();
	}

}
