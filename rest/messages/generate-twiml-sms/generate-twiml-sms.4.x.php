<?php
// Get the PHP helper library from twilio.com/docs/php/install

// this line loads the library
require('/path/to/twilio-php/Services/Twilio.php');

$response = new Services_Twilio_Twiml;
$response->message("The Robots are coming! Head for the hills!");
print $response;
