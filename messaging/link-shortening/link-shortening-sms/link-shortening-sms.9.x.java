// Install the Java helper library from twilio.com/docs/java/install

import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;

public class Example {
    // Find your Account SID and Auth Token at twilio.com/console
    // and set the environment variables. See http://twil.io/secure
    public static final String ACCOUNT_SID = System.getenv("TWILIO_ACCOUNT_SID");
    public static final String AUTH_TOKEN = System.getenv("TWILIO_AUTH_TOKEN");

    public static void main(String[] args) {
        Twilio.init(ACCOUNT_SID, AUTH_TOKEN);
        Message message = Message.creator(
                new com.twilio.type.PhoneNumber("+15551212121"),
                "MGXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
                "Visit this link to start earning rewards today! https://example.com/N6uAirXeREkpV2MW7kpV2MW7TAvh1zn4gEFMTAvh1zn4gEFMN6uAirXeRE")
            .setShortenUrls(true).create();

        System.out.println(message.getSid());
    }
}
