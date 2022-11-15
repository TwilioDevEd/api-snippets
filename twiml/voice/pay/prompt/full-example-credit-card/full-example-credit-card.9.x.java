import com.twilio.twiml.voice.Pay;
import com.twilio.twiml.voice.Prompt;
import com.twilio.twiml.VoiceResponse;
import com.twilio.twiml.voice.Say;
import com.twilio.twiml.TwiMLException;
import java.util.Arrays;

public class Example {
    public static void main(String[] args) {
        Say say = new Say.Builder("Please enter your credit card number.").build();
        Prompt prompt = new Prompt.Builder().for_(Prompt.For.PAYMENT_CARD_NUMBER).say(say).build();
        Say say2 = new Say.Builder("You didn't enter your credit card number. Please enter your credit card number.").build();
        Prompt prompt2 = new Prompt.Builder().errorTypes(Prompt.ErrorType.TIMEOUT).for_(Prompt.For.PAYMENT_CARD_NUMBER).say(say2).build();
        Say say3 = new Say.Builder("Please enter your credit card's expiration date. Two digits for the month and two digits for the year.").build();
        Prompt prompt3 = new Prompt.Builder().for_(Prompt.For.EXPIRATION_DATE).say(say3).build();
        Say say4 = new Say.Builder("You didn't enter your credit card security code. Please enter your security code. It's the 3 digits located on the back of your card.").build();
        Prompt prompt4 = new Prompt.Builder().cardTypes(Arrays.asList(Prompt.CardType.VISA, Prompt.CardType.MASTERCARD)).errorTypes(Prompt.ErrorType.TIMEOUT).for_(Prompt.For.SECURITY_CODE).say(say4).build();
        Say say5 = new Say.Builder("Thank you. Please wait while we process your payment.").build();
        Prompt prompt5 = new Prompt.Builder().for_(Prompt.For.PAYMENT_PROCESSING).say(say5).build();
        Say say6 = new Say.Builder("You didn't enter your credit card security code.  Please enter your security code. It's the 4 digits located on the front of your card.").build();
        Prompt prompt6 = new Prompt.Builder().cardTypes(Prompt.CardType.AMEX).errorTypes(Prompt.ErrorType.TIMEOUT).for_(Prompt.For.SECURITY_CODE).say(say6).build();
        Say say7 = new Say.Builder("The card number you entered isn't from one of our accepted credit card issuers. Please enter a Visa, MasterCard, or American Express credit card number.").build();
        Prompt prompt7 = new Prompt.Builder().errorTypes(Prompt.ErrorType.INVALID_CARD_TYPE).for_(Prompt.For.PAYMENT_CARD_NUMBER).say(say7).build();
        Say say8 = new Say.Builder("Please enter your 5 digit billing zip code.").build();
        Prompt prompt8 = new Prompt.Builder().for_(Prompt.For.POSTAL_CODE).say(say8).build();
        Say say9 = new Say.Builder("That was an invalid security code. The security code must be 4 digits. Please try again.").build();
        Prompt prompt9 = new Prompt.Builder().cardTypes(Prompt.CardType.AMEX).errorTypes(Prompt.ErrorType.INVALID_SECURITY_CODE).for_(Prompt.For.SECURITY_CODE).say(say9).build();
        Say say10 = new Say.Builder("That was an invalid security code. The security code must be 3 digits. Please try again.").build();
        Prompt prompt10 = new Prompt.Builder().cardTypes(Arrays.asList(Prompt.CardType.VISA, Prompt.CardType.MASTERCARD)).errorTypes(Prompt.ErrorType.INVALID_SECURITY_CODE).for_(Prompt.For.SECURITY_CODE).say(say10).build();
        Say say11 = new Say.Builder("You didn't enter your billing zip code. Please enter your 5 digit billing zip code.").build();
        Prompt prompt11 = new Prompt.Builder().errorTypes(Prompt.ErrorType.TIMEOUT).for_(Prompt.For.POSTAL_CODE).say(say11).build();
        Say say12 = new Say.Builder("Please enter your security code. It's the 3 digits located on the back of your card.").build();
        Prompt prompt12 = new Prompt.Builder().cardTypes(Arrays.asList(Prompt.CardType.VISA, Prompt.CardType.MASTERCARD)).for_(Prompt.For.SECURITY_CODE).say(say12).build();
        Say say13 = new Say.Builder("The date you entered was incorrect or is in the past. Please enter the expiration date. Two digits for the month and two digits for the year. For example, to enter July twenty twenty two, enter 0 7 2 2.").build();
        Prompt prompt13 = new Prompt.Builder().errorTypes(Prompt.ErrorType.INVALID_DATE).for_(Prompt.For.EXPIRATION_DATE).say(say13).build();
        Say say14 = new Say.Builder("You entered an invalid credit card number. Please try again.").build();
        Prompt prompt14 = new Prompt.Builder().errorTypes(Prompt.ErrorType.INVALID_CARD_NUMBER).for_(Prompt.For.PAYMENT_CARD_NUMBER).say(say14).build();
        Say say15 = new Say.Builder("Sorry. You didn't enter an expiration date. Please enter your card's expiration date. Two digits for the month and two digits for the year.").build();
        Prompt prompt15 = new Prompt.Builder().errorTypes(Prompt.ErrorType.TIMEOUT).for_(Prompt.For.EXPIRATION_DATE).say(say15).build();
        Say say16 = new Say.Builder("Please enter your security code. It's the 4 digits located on the front of your card.").build();
        Prompt prompt16 = new Prompt.Builder().cardTypes(Prompt.CardType.AMEX).for_(Prompt.For.SECURITY_CODE).say(say16).build();
        Pay pay = new Pay.Builder().paymentMethod(Pay.PaymentMethod.CREDIT_CARD).validCardTypes(Arrays.asList(Pay.ValidCardTypes.VISA, Pay.ValidCardTypes.MASTERCARD, Pay.ValidCardTypes.AMEX)).prompt(prompt).prompt(prompt2).prompt(prompt14).prompt(prompt7).prompt(prompt3).prompt(prompt15).prompt(prompt13).prompt(prompt12).prompt(prompt4).prompt(prompt10).prompt(prompt16).prompt(prompt6).prompt(prompt9).prompt(prompt8).prompt(prompt11).prompt(prompt5).build();
        VoiceResponse response = new VoiceResponse.Builder().pay(pay).build();

        try {
            System.out.println(response.toXml());
        } catch (TwiMLException e) {
            e.printStackTrace();
        }
    }
}
