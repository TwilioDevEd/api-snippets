import com.twilio.twiml.voice.Pay;
import com.twilio.twiml.voice.Prompt;
import com.twilio.twiml.VoiceResponse;
import com.twilio.twiml.voice.Say;
import com.twilio.twiml.TwiMLException;


public class Example {
    public static void main(String[] args) {
        Say say = new Say.Builder("Thanks for using our service. Please enter your bank account number.").build();
        Prompt prompt = new Prompt.Builder().for_(Prompt.For.BANK_ACCOUNT_NUMBER).say(say).build();
        Say say2 = new Say.Builder("Thank you. Please enter your bank account number again.").build();
        Prompt prompt2 = new Prompt.Builder().requireMatchingInputs(true).for_(Prompt.For.BANK_ACCOUNT_NUMBER).say(say2).build();
        Pay pay = new Pay.Builder().paymentMethod(Pay.PaymentMethod.ACH_DEBIT).chargeAmount("13.22").prompt(prompt).prompt(prompt2).build();
        VoiceResponse response = new VoiceResponse.Builder().pay(pay).build();

        try {
            System.out.println(response.toXml());
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
    }
}
