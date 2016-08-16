package com.twilio;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import java.io.IOException;

import com.twilio.sdk.client.TwilioCapability;
import com.twilio.sdk.client.TwilioCapability.DomainException;

public class TwilioServlet extends HttpServlet {

    public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    public static final String AUTH_TOKEN = "your_auth_token";

    public void service(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        // Find an application Sid from twilio.com/user/account/apps
        String applicationSid = "APXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        TwilioCapability capability = new TwilioCapability(ACCOUNT_SID, AUTH_TOKEN);
        capability.allowClientOutgoing(applicationSid);
        capability.allowClientIncoming("jenny");

        String token = null;
        try {
            token = capability.generateToken();
        } catch (DomainException e) {
            e.printStackTrace();
        }
        response.setContentType("text/html");
        request.setAttribute("token", token);
        RequestDispatcher view = request.getRequestDispatcher("client.jsp");
        view.forward(request, response);
    }
}