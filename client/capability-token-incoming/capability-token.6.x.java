package com.twilio;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.twilio.sdk.client.TwilioCapability;

public class TwilioServlet extends HttpServlet {

    public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    public static final String AUTH_TOKEN = "your_auth_token";

    public void service(HttpServletRequest request, HttpServletResponse response) throws IOException {

        TwilioCapability capability = new TwilioCapability(ACCOUNT_SID, AUTH_TOKEN);
        capability.allowClientIncoming("joey");

        String token = capability.generateToken();

        response.setContentType("application/jwt");
        response.getWriter().print(token);
    }
}