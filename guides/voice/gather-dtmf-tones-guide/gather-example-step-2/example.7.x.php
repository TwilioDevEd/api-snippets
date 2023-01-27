<?php
// Create a route that will handle Twilio webhook requests, sent as an
// HTTP POST to /voice in our application
require_once '/path/to/vendor/autoload.php';

use Twilio\TwiML\VoiceResponse;

// Use the Twilio PHP SDK to build an XML response
$response = new VoiceResponse();

// Use the <Gather> verb to collect user input
$gather = $response->gather(array('numDigits' => 1, 'action' => '/gather'));
// use the <Say> verb to request input from the user
$gather->say('For sales, press 1. For support, press 2.');

// If the user doesn't enter input, loop
$response->redirect('/voice');

// Render the response as XML in reply to the webhook request
header('Content-Type: text/xml');
echo $response;
