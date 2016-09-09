@SuppressWarnings("serial")
@WebServlet("/voice")
public class RecordServlet extends HttpServlet {

  // Handle HTTP POST to /record
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    // Create a TwiML builder object
    TwiMLResponse twiml = new TwiMLResponse();
    
    TwiMLResponse twiml = new TwiMLResponse();
    try {
      // Use <Say> to give the caller some instructions
      twiml.append(new Say("Hello. Please leave a message after the beep."));

      // Use <Record> to record and transcribe the caller's message
      Record record = new Record();
      record.setTranscribe(true);
      record.setMaxLength(30);
      twiml.append(new Record());

      // End the call with <Hangup>
      twiml.append(new Hangup());
    } catch (TwiMLException e) {
      e.printStackTrace();
    }
    
    // Render TwiML as XML
    response.setContentType("text/xml");
    response.getWriter().print(twiml.toXML());
  }
}