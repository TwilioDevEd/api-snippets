// This code sample serves to filter robocalls prior to taking a voicemail.

// Twilio Functions automatically executes the exports.handler method in any
// code you write. It comes with inputs for a context, event, and callback.
// Full documentation: https://www.twilio.com/docs/runtime/functions/invocation
exports.handler = (context, event, callback) => {
    // Create a new voice response object
    const twiml = new Twilio.twiml.VoiceResponse();
    const addOns = event.AddOns;
    let blockCalls = false;
    
    // verify that the addOn executed properly
    if (addOns.status === 'successful') {
      // if the addOn executed properly, verify that the number is legitimate.
      blockCalls = ekata_results(addOns.results.ekata_phone_valid);
    }
    if (blockCalls) {
      // should the number be illegitimate, end the operation. 
      twiml.reject();
    } else {
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
    }
    // callback has two parameters: error and response.
    // since we are exiting successfully, we set error to null
    // the provided twiml is returned to the caller in the callback
    return callback(null, twiml);
  }
  
  // function that helps us check the addOns results
  function ekata_results(ekata) {
    // documentation on ekata JSON can be found by navigating to the Add-ons'
    // page in the Marketplace, and selecting the 'documentation' tab.
    if(!ekata || ekata.status !== "success") return false; 
    return ekata.result.is_valid;
  }
  