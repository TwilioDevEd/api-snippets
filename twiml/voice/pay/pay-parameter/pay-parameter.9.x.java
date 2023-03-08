import com.twilio.twiml.voice.Parameter;
import com.twilio.twiml.voice.Pay;
import com.twilio.twiml.VoiceResponse;
import com.twilio.twiml.TwiMLException;


public class Example {
    public static void main(String[] args) {
        Parameter parameter = new Parameter.Builder().name("custom_parameter_1").value("custom_value_1").build();
        Pay pay = new Pay.Builder().chargeAmount("10.00").paymentConnector("My_Generic_Pay_Connector").action("https://your-callback-function-url.com/pay").parameter(parameter).build();
        VoiceResponse response = new VoiceResponse.Builder().pay(pay).build();

        try {
            System.out.println(response.toXml());
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
    }
}