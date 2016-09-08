@SuppressWarnings("serial")
@WebServlet("/voice")
public class IncomingCallServlet extends HttpServlet {
  
  // Update with your own phone number in E.164 format
  public static final String MODERATOR = "+15558675309";

  // Handle HTTP POST to /voice
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    // Create a TwiML builder object
    TwiMLResponse twiml = new TwiMLResponse();
    
    // Get the number of the incoming caller
    String fromNumber = request.getParameter("From");
    
    try {
      Dial dial = new Dial();
      Conference conf = new Conference("My Conference");
      if (MODERATOR.equalsIgnoreCase(fromNumber)) {
        conf.setStartConferenceOnEnter(true);
        conf.setEndConferenceOnExit(true);
      } else {
        conf.setEndConferenceOnExit(false);
      }
      dial.append(conf);
      twiml.append(dial);
    } catch (TwiMLException e) {
      e.printStackTrace();
    }
    
    // Render TwiML as XML
    response.setContentType("text/xml");
    response.getWriter().print(twiml.toXML());
  }
}
