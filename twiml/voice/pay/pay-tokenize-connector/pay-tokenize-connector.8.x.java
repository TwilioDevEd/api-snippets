import com.twilio.twiml.voice.Pay;
import com.twilio.twiml.VoiceResponse;
import com.twilio.twiml.TwiMLException;


public class Example {
    public static void main(String[] args) {
        Pay pay = new Pay.Builder().chargeAmount("0")
            .paymentConnector("My_Pay_Connector")
            .action("https://your-callback-function-url.com/pay")
            .build();
        VoiceResponse response = new VoiceResponse.Builder().pay(pay).build();

        try {
            System.out.println(response.toXml());
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
    }
}
