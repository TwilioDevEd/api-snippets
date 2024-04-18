import com.twilio.twiml.voice.Pay;
import com.twilio.twiml.voice.Prompt;
import com.twilio.twiml.VoiceResponse;
import com.twilio.twiml.voice.Say;
import com.twilio.twiml.TwiMLException;


public class Example {
    public static void main(String[] args) {
        Say say = new Say.Builder("Please enter your bank routing number.").build();
        Prompt prompt = new Prompt.Builder().for_(Prompt.For.BANK_ROUTING_NUMBER).say(say).build();
        Say say2 = new Say.Builder("Thank you. Please wait while we process your payment.").build();
        Prompt prompt2 = new Prompt.Builder().for_(Prompt.For.PAYMENT_PROCESSING).say(say2).build();
        Say say3 = new Say.Builder("That was an invalid bank routing number. Please try again.").build();
        Prompt prompt3 = new Prompt.Builder().errorTypes(Prompt.ErrorType.INVALID_BANK_ROUTING_NUMBER).for_(Prompt.For.BANK_ROUTING_NUMBER).say(say3).build();
        Say say4 = new Say.Builder("You didn't enter your bank account number. Please enter your bank account number.").build();
        Prompt prompt4 = new Prompt.Builder().errorTypes(Prompt.ErrorType.TIMEOUT).for_(Prompt.For.BANK_ACCOUNT_NUMBER).say(say4).build();
        Say say5 = new Say.Builder("Please enter your bank account number.").build();
        Prompt prompt5 = new Prompt.Builder().for_(Prompt.For.BANK_ACCOUNT_NUMBER).say(say5).build();
        Say say6 = new Say.Builder("You didn't enter your routing number. Please enter your bank routing number.").build();
        Prompt prompt6 = new Prompt.Builder().errorTypes(Prompt.ErrorType.TIMEOUT).for_(Prompt.For.BANK_ROUTING_NUMBER).say(say6).build();
        Pay pay = new Pay.Builder().timeout(5).maxAttempts(3).paymentMethod(Pay.PaymentMethod.ACH_DEBIT).language(Pay.Language.EN_US).prompt(prompt).prompt(prompt6).prompt(prompt3).prompt(prompt5).prompt(prompt4).prompt(prompt2).build();
        VoiceResponse response = new VoiceResponse.Builder().pay(pay).build();

        try {
            System.out.println(response.toXml());
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
    }
}
