@SuppressWarnings("serial")
@WebServlet("/voice")
public class IncomingCallServlet extends HttpServlet {

  // Handle HTTP POST to /voice
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    // Create a TwiML builder object
    TwiMLResponse twiml = new TwiMLResponse();
    
    // Get the city from the incoming call (if available)
    String fromCity = request.getParameter("FromCity");
    if (fromCity == null) {
      fromCity = "home slice";
    }
    
    try {
      Say message = new Say(String.format("Never gonna give you up, %s!", fromCity));
      message.setVoice("alice");
      Play song = new Play("https://demo.twilio.com/docs/classic.mp3");
      twiml.append(message);
      twiml.append(song);
    } catch (TwiMLException e) {
      e.printStackTrace();
    }
    
    // Render TwiML as XML
    response.setContentType("text/xml");
    response.getWriter().print(twiml.toXML());
  }

}
