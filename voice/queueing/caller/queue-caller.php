<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once('/path/to/twilio-php/Services/Twilio.php'); // Loads the library

$response = new Services_Twilio_Twiml;
$response->enqueue('Queue Demo');
print $response;
