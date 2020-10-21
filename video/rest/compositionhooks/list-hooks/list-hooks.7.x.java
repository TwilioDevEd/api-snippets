// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.Twilio;
import com.twilio.rest.video.v1.CompositionHook;

public class ListCompositionHooks{

  // Find your credentials at twilio.com/console
  // To set up environment variables, see http://twil.io/secure
  public static final String ACCOUNT_SID = System.getenv("TWILIO_ACCOUNT_SID");
  public static final String API_KEY_SID = System.getenv("TWILIO_API_KEY_SID");
  public static final String API_KEY_SECRET = System.getenv("TWILIO_API_KEY_SECRET");

  public static void main( String[] args ) throws IOException{
      // Initialize the client
      Twilio.init(API_KEY_SID, API_KEY_SECRET, ACCOUNT_SID);

      ResourceSet<CompositionHook> hooks = CompositionHook.reader()
         		.setEnabled(true)
         		.read();

      for(CompositionHook hook : hooks){
        System.out.println("Read Composition Hook with SID=" + hook.getSid());
      }
  }
}
