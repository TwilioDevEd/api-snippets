// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.Twilio;
import com.twilio.rest.taskrouter.v1.workspace.TaskChannel;

public class CreateTaskChannel {
	// Find your Account Sid and Token at twilio.com/user/account
	private static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
	private static final String AUTH_TOKEN = "your_auth_token";
	private static final String WORKSPACE_SID = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

	public static void main(String[] args) {
		Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

		TaskChannel channel = TaskChannel.creator(WORKSPACE_SID)
			.setFriendlyName("My Channel")
			.setUniqueName("my-channel")
			.create();

		System.out.println(channel.getUniqueName());
	}

}
