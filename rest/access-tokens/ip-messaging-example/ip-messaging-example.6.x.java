package com.twilio;
import com.twilio.sdk.auth.AccessToken;
import com.twilio.sdk.auth.IpMessagingGrant;

public class TokenGenerator {
  
  public static void main(String[] args) {
    // Required for all types of tokens
    String twilioAccountSid = "ACxxxxxxxxxxxx";
    String twilioApiKey = "SKxxxxxxxxxxxx";
    String twilioApiSecret = "xxxxxxxxxxxxxx";

    // Required for IP Messaging
    String ipmServiceSid = "ISxxxxxxxxxxxx";
    String identity = "user@example.com";
      
    // Create IP messaging grant
    IpMessagingGrant grant = new IpMessagingGrant();
    grant.setServiceSid(ipmServiceSid);
    
    // Create access token
    AccessToken token = new AccessToken.Builder(
      twilioAccountSid,
      twilioApiKey,
      twilioApiSecret
    ).identity(identity).grant(grant).build();

    System.out.println(token.toJWT());
  }
}
