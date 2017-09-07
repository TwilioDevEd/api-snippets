<?php
// Get the PHP helper library from twilio.com/docs/php/install

// this line loads the library
require_once '/path/to/vendor/autoload.php';
use Twilio\Twiml;

// Update with your own phone number in E.164 format
$MODERATOR = '+15558675309';

$response = new Twiml;

// Start with a <Dial> verb
$dial = $response->dial();

// If the caller is our MODERATOR, then start the conference when they
// join and end the conference when they leave
if ($_REQUEST['From'] == $MODERATOR) {
    $dial->conference('My conference', array(
                'startConferenceOnEnter' => true,
                'endConferenceOnExit' => true
                ));
} else {
    // Otherwise have the caller join as a regular participant
    $dial->conference('My conference', array(
                'startConferenceOnEnter' => false
                ));
}

print $response;
