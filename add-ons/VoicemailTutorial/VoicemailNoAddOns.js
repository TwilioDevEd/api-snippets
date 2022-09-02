// This code sample outlines how to create a webhook using Twilio Functions that
// records a transcribed voicemail and then hangs up. For the complete version,
// including Add-on integration, copy and paste the next code sample on this page.

// Twilio Functions automatically executes the exports.handler method in any
// code you write. The parameters provided are context, event, and callback.
// Full documentation: https://www.twilio.com/docs/runtime/functions/invocation
exports.handler = (context, event, callback) => {
    // Create a new Voice response object
    const twiml = new Twilio.twiml.VoiceResponse();
    
    // Give some input to the caller prompting them to leave a message. We
    // recommend adding some identification information for yourself.
    twiml.say('Enter a message here prompting callers to leave a message');
  
    // Use <Record> to record the caller's message, and play an audible beep. 
    // Additionally, transcribe the recording for more information at a glance. 
    twiml.record({
      transcribe: true,
      playBeep: true
    });
  
    // End the call with <Hangup>
    twiml.hangup();
  
    // Callback accepts two arguments: error and response.
    // Since we are exiting successfully, we set error to null
    // and return the TwiML to the caller as the response.
    return callback(null, twiml);
  }