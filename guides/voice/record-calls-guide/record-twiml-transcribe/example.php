<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once '/path/to/vendor/autoload.php'; // Loads the library


# Start our TwiML response
$response = new Twilio\Twiml();

# Use <Say> to give the caller some instructions
$response->say('Hello. Please leave a message and I will transcribe it.');

# Use <Record> to record and transcribe the caller's message
$response->record(array('transcribe' => true, 'maxLength' => 30));

# End the call with <Hangup>
$response->hangup();

echo $response;
