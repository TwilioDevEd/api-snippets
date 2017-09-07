<?php
// Get the PHP helper library from twilio.com/docs/php/install

// this line loads the library
require('/path/to/twilio-php/Services/Twilio.php');
use Services_Twilio_Twiml;

$response = new Services_Twilio_Twiml;
$response->say("Hello. It's me. I've been wondering if after this guide you'd like to meet.");
$response->play("http://howtodocs.s3.amazonaws.com/ahoyhoy.mp3");
print $response;
