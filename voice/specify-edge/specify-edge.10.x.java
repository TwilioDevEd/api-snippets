import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Call;
import com.twilio.type.PhoneNumber;
import com.twilio.type.Twiml;

public class Example {

    public static final String ACCOUNT_SID = System.getenv("ACCOUNT_SID");
    public static final String API_KEY_SID = System.getenv("API_KEY_SID");
    public static final String API_KEY_SECRET = System.getenv("API_KEY_SECRET");

    public static final String TO_NUMBER = System.getenv("TO_NUMBER");
    public static final String FROM_NUMBER = System.getenv("FROM_NUMBER");

    public static void main(String[] args) {
        Twilio.init(API_KEY_SID, API_KEY_SECRET, ACCOUNT_SID);
        Twilio.setEdge("dublin");
        Twilio.setRegion("ie1");
        
        Call call = Call.creator(
                new com.twilio.type.PhoneNumber(TO_NUMBER),
                new com.twilio.type.PhoneNumber(FROM_NUMBER),
                new com.twilio.type.Twiml("<Response><Say>Ahoy from Ireland</Say></Response>"))
            .create();
    }
}
