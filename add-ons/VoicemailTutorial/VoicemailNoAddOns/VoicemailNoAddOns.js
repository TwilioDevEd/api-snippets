// This code sample outlines how to take a recording utilizing webhooks, and 
// then hangup. For the complete version including Add-on integration, it is
// recommended to copy paste the next code sample on this page. 

// Twilio Functions automatically executes the exports.handler method in any
// code you write. It comes with inputs for a context, event, and callback.
// Full documentation: https://www.twilio.com/docs/runtime/functions/invocation
exports.handler = (context, event, callback) => {
    // Create a new voice response object
    const twiml = new Twilio.twiml.VoiceResponse();
    
    // Give some input to the caller prompting them to leave a message. We
    // recommend adding some identification information for yourself.
    twiml.say('Enter a message here prompting callers to leave a message');
  
    // Use <Record> to record the caller's message, and play an audible beep. 
    // additionally, attempt to transcribe for more information at a glance. 
    twiml.record({
      transcribe: true,
      playBeep: true
    });
  
    // End the call with <Hangup>
    twiml.hangup();
  
    // callback has two parameters: error and response.
    // since we are exiting successfully, we set error to null
    // the provided twiml is returned to the caller in the callback
    return callback(null, twiml);
  }