// NOTE: This example uses the next generation Twilio helper library - for more
// information on how to download and install this version, visit
// https://www.twilio.com/docs/libraries/java
import java.util.Arrays;
import java.util.List;

import com.twilio.Twilio;
import com.twilio.rest.notify.service.Binding;

public class Example {
  // Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "ACCOUNT_SID";
  public static final String AUTH_TOKEN = "AUTH_TOKEN";

  public static final String SERVICE_SID = "ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

  public static void main(String[] args) {
    // Initialize the client
    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

    List<String> tags = Arrays.asList("premium", "new user");

    Binding binding = Binding.creator
    (
      SERVICE_SID,
      "eyJjdHkiOiJ0d2lsaW8tZnBhO3Y9MSIsInR5cCI6IkpXVCIsImFsZyI6IkhTMjU2In0.eyJncmFudHMiOnsiY2hhdCI6eyJzZXJ2aWNlX3NpZCI6IklTNmIwZmE2MDgzOWM1MTFlNWExNTFmZWZmODE5Y2RjOWYiLCJlbmRwb2ludF9pZCI6InR3aTEtMTdjNTkyM2Y5NTBiNGJhYjllZjAwZTJlZjdkYTBkYTIifSwiaWRlbnRpdHkiOiJOb3RpZmljYXRpb25MaWJyYXJ5VW5pdFRlc3RlcjEifSwic3ViIjoiQUM3OGU4ZTY3ZmMwMjQ2NTIxNDkwZmI5OTA3ZmQwYzE2NSIsImlzcyI6IlNLMmQxYWRmOGIxYzY0YTYzM2U1ZjE4NjU5ZjdjZDE5MTEiLCJleHAiOjE0NzgyNTI4NTl9.1i256CwtacP859Xh-6cEZVio4oohxL-od9krzsa4DnY",
      "00000001",
      Binding.BindingType.APN,
      "483161f7afe6f012aa5f172d3ca93f5c245e3daf34d3a911a41f41f6af3639f6"
    )
    .setTag(tags)
    .create();

    System.out.println(binding.getSid());
  }
}
