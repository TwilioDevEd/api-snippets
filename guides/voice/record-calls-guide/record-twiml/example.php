<?php
// Get the PHP helper library from https://twilio.com/docs/libraries/php
require_once '/path/to/vendor/autoload.php'; // Loads the library


# Start our TwiML response
$response = new Twilio\TwiML\VoiceResponse();

# Use <Say> to give the caller some instructions
$response->say('Hello. Please leave a message after the beep.');

# Use <Record> to record the caller's message
$response->record();

# End the call with <Hangup>
$response->hangup();

echo $response;
