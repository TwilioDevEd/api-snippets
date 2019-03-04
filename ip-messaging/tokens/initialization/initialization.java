import com.twilio.chat.ChatClient;
import com.twilio.chat.ChatClientListener;

ChatClient.Properties.Builder builder = new ChatClient.Properties.Builder();
ChatClient.Properties properties = builder.createProperties();
// See below for client event listener implementation
ChatClientListener listener = new Listener();

// Make a secure request to your backend to retrieve an access token.
// Use an authentication mechanism to prevent token exposure to 3rd parties.

String accessToken = "<your token here>";

ChatClient.create(getApplicationContext(), accessToken, properties, listener);
