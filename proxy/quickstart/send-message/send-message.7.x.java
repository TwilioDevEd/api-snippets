// NOTE: This example uses the ALPHA release of the next generation Twilio
// helper library - for more information on how to download and install this version, visit
// https://www.twilio.com/docs/libraries/java#accessing-preview-twilio-features

import com.twilio.Twilio;
import com.twilio.rest.preview.proxy.service.session.participant.MessageInteraction;

public class Example {
  // Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  public static final String AUTH_TOKEN = "your_auth_token";

  public static void main(String[] args) {
    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

    MessageInteraction message = MessageInteraction.creator(
      "KSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
      "KCXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
      "KPXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
      "Reply to this message to chat!")
      .create();

    System.out.println(message.getSid());
  }
}
