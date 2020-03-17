<?php
// Get the PHP helper library from https://twilio.com/docs/libraries/php

// this line loads the library 
require_once '/path/to/vendor/autoload.php';
use Twilio\TwiML\VoiceResponse;

// Update with your own phone number in E.164 format
$MODERATOR = '+15558675310';

$response = new VoiceResponse;

// Start with a <Dial> verb
$dial = $response->dial();

// If the caller is our MODERATOR, then start the conference when they
// join and end the conference when they leave
if ($_REQUEST['From'] == $MODERATOR) {
  $dial->conference('My conference', array(
                'startConferenceOnEnter' => True,
                'endConferenceOnExit' => True
                ));
} else {
  // Otherwise have the caller join as a regular participant
  $dial->conference('My conference', array(
                'startConferenceOnEnter' => False
                ));
}

print $response;