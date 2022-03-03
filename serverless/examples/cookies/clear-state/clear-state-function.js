exports.handler = (context, event, callback) => {
  // Initialize a new Response and some TwiML
  const response = new Twilio.Response();
  const twiml = new Twilio.twiml.MessagingResponse();

  // Since we're returning TwiML, the content type must be XML
  response.appendHeader('Content-Type', 'text/xml');

  // Cookies are accessed by name from the event.request.cookies object
  // If the user doesn't have a count yet, initialize it to zero. Cookies are
  // always strings, so you'll need to convert the count to a number
  const count = Number(event.request.cookies.count) || 0;

  if (count > 5) {
    twiml.message("You've reached the end of the count!");
    // In this case we want to remove the count and let the user begin
    // a new conversation
    response.setBody(twiml.toString()).removeCookie('count');
    // Use an early return to respond to the user and avoid other logic paths
    return callback(null, response);
  }

  // Return a dynamic message based on if this is the first message or not
  const message =
    count > 0
      ? `Your current count is ${count}`
      : 'Hello, thanks for the new message! Message again to see your count update.';

  twiml.message(message);

  response.setBody(twiml.toString()).setCookie('count', (count + 1).toString());

  return callback(null, response);
};
