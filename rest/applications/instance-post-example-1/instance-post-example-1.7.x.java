// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.rest.Twilio;
import com.twilio.rest.resource.api.v2010.account.Application;
import com.twilio.rest.updater.api.v2010.account.ApplicationUpdater;

public class Example {
  // Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  public static final String AUTH_TOKEN = "your_auth_token";

  public static void main(String[] args) {
    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

    // Get an object from its sid. If you do not have a sid,
    // check out the list resource examples on this page
    Application app = new ApplicationUpdater("AP2a0747eba6abf96b7e3c3ff0b4530f6e")
        .setVoiceUrl("http://demo.twilio.com/docs/voice.xml")
        .setSmsUrl("http://demo.twilio.com/docs/sms.xml").execute();

    System.out.println(app.getDateUpdated());
  }
}
