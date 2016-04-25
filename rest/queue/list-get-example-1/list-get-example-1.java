// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.sdk.TwilioRestClient;
import com.twilio.sdk.TwilioRestException;
import com.twilio.sdk.resource.instance.Queue;
import com.twilio.sdk.resource.list.QueueList;

public class Example { 

  // Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "AC5ef8732a3c49700934481addd5ce1659";
  public static final String AUTH_TOKEN = "{{ auth_token }}";

  public static void main(String[] args) throws TwilioRestException {
    TwilioRestClient client = new TwilioRestClient(ACCOUNT_SID, AUTH_TOKEN);
 
    QueueList queues = client.getAccount().getQueues();
    
    // Loop over queues and print out a property for each one.
    for (Queue queue : queues) {
      System.out.println(queue.getAverageWaitTime());
    }
    
  }
}