// NOTE: This example uses the next generation Twilio helper library - for more
// information on how to download and install this version, visit
// https://www.twilio.com/docs/libraries/java
import com.twilio.sdk.Twilio;
import com.twilio.sdk.resource.ResourceSet;
import com.twilio.sdk.resource.notifications.v1.service.Binding;

import java.util.Iterator;

public class ListBinding {
  // Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  public static final String AUTH_TOKEN = "your_auth_token";

  public static void main(String args[]) {
    // Initialize the client
    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

    // List the bindings
    ResourceSet<Binding> bindings = Binding.read("ISxxx").execute();
    Iterator<Binding> iterator = bindings.iterator();
    while (iterator.hasNext()) {
      Binding binding = iterator.next();
      System.out.println(binding.toString());
    }
  }
}