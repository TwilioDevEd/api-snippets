// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.Twilio;
import com.twilio.base.ResourceSet;
import com.twilio.rest.taskrouter.v1.workspace.TaskChannel;

public class ListTaskChannels {
	// Get your Account SID and Auth Token from https://twilio.com/console
	private static final String ACCOUNT_SID = System.getenv("TWILIO_ACCOUNT_SID");
	private static final String AUTH_TOKEN = System.getenv("TWILIO_AUTH_TOKEN");
	private static final String WORKSPACE_SID = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

	public static void main(String[] args) {
		Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

		ResourceSet<TaskChannel> channels = TaskChannel.reader(WORKSPACE_SID).read();

		for (TaskChannel channel : channels) {
			System.out.println(channel.getUniqueName());
		}
	}

}
