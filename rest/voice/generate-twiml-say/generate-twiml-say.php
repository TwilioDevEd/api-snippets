<?php
// Get the PHP helper library from twilio.com/docs/php/install

// this line loads the library 
require('/path/to/twilio-php/Services/Twilio.php'); 
use Services_Twilio_Twiml;

$response = new Services_Twilio_Twiml;
$response->say("Hello from your pals at Twilio! Have fun.");
print $response;
